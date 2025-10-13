
# 安装命令
install()
{
	echo "ssh-login install ......"
	local dir="/usr/bin"
	cp ./$0 $dir
	chmod +x $dir/$0
	ln -s  $dir/$0 $dir/ssh-login
}

# 登陆命令
login()
{
    local cmd=$1
    local host=$2
    local port=$3
    if [ $cmd = "ssh" ]; then
           (ssh -o HostKeyAlgorithms=ssh-rsa -p $port $host)
    elif [ $cmd = "sftp" ] || [ $cmd = "ftp" ] ; then
           (sftp -o HostKeyAlgorithms=ssh-rsa -P $port $host)
    else
	   echo "UNKNOWN COMMAND : $cmd ......"
    fi
}

arg=$1
cmd=${arg:="ssh"}

if [ $cmd = "install" ]; then
     install
else
     port=2222
     username="goupeng"
     host="${username}@192.168.0.180"
     login $cmd $host $port
fi
