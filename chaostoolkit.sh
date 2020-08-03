
CHAOS_BRANCH=`echo ${chaostoolkit_branch} | cut -d":" -f 2`


if [ "$CHAOS_BRANCH" = "" ]
then
    CHAOS_BRANCH=master
fi

git clone https://github.com/manojgodara/chaostk-cicd.git
cd chaostk-cicd
git checkout $CHAOS_BRANCH

CHAOS_CLI_HOME=${WORKSPACE}/chaostk-cicd

################### Install CLI ############################
echo "Installing python3..." `python3 --version`

sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python35u

echo "python3 version: " `python3 --version`

python3 -m venv ~/.venvs/chaostk
source  ~/.venvs/chaostk/bin/activate

echo "Installing chaostoolkit..."
pip install chaostoolkit
echo "chaostoolkit version: " `chaos --version`

echo "Installing chaostoolkit-spring..."
pip install -U chaostoolkit-spring

chaos run experiment.json