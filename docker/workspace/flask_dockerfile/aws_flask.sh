#!/bin/bash

# ������ ������Ʈ
apt-get update;

# ���̽� ��Ű�� ��ġ �� pip ��ġ
apt install -y python3-pip;

# ���̽� pip ������ ���� �ϵ��� �ϴ� wheel ��ġ
pip3 install wheel;

# Flask ��ġ
pip3 install Flask;

# pandas ��ġ
pip3 install pandas;

# matplotlib ��ġ
pip3 install matplotlib;

# pyecharts ��ġ
pip3 install pyecharts;

# waitress ��ġ
pip3 install waitress;

# hello_flask ������ ���� ����
mkdir -p /home/ubuntu/ai/cloud/workspace/flask_project/;

# /root ������ ������ hello_flask ������ /home/ubuntu/ai/cloud/workspace/flask_project/ �� ����
cp -r /root/hello_flask  /home/ubuntu/ai/cloud/workspace/flask_project/; 

# /home/ubuntu/ai ������ ������ ��� ����ڰ� �а� ���� ���� �����ϵ��� ����
chmod -R 777 /home/ubuntu/ai;

# nginx ��ġ
apt install -y nginx;

# nginx ��ġ�� /etc/nginx/sites-available ���� ����
mkdir -p  /etc/nginx/sites-available;

# nginx ���� ������ /etc/nginx/sites-available/ ������ ����
cp /root/hello_flask.conf /etc/nginx/sites-available;

# AWS ������ Ȯ��
curl ipecho.net/plain; echo;

# AWS �����Ǹ� ���� my_ip�� ����
my_ip="$(curl ipecho.net/plain; echo)";

# ���� my_ip ���
echo $my_ip;
# sed�� ���Ͽ��� Ư�� ���ڸ� ã�Ƽ� �ٲ��ִ� �Լ� 
# localhost�� ã�Ƽ� my_ip ������ ����

sed 's/localhost/'"$my_ip"'/' -i /etc/nginx/sites-available/hello_flask.conf;


# nginx ���� ���� ����
rm /etc/nginx/sites-enabled/default;


# nginx ����
ln -s /etc/nginx/sites-available/hello_flask.conf /etc/nginx/sites-enabled/;

# nginx �� ������ 777�� ����
chmod -R 777 /etc/nginx;

# nginx �����ϴ� ����ڸ� ���� www-data ���� root �� ����
sed 's/www-data/root/' -i /etc/nginx/nginx.conf;
 


# nginx �����
systemctl restart nginx;

# ������Ʈ ��ġ
apt -qq -y install fonts-nanum;

# ������Ʈ matplotlib�� ����
cp /usr/share/fonts/truetype/nanum/Nanum* /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/fonts/ttf/;