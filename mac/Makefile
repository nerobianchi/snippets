hede: git setup linux mac

.PHONY: git
git:
	@echo 'git is in place'

.PHONY: setup
setup:
	@echo 'setup is in place'
	# minikube
	# https://github.com/kubernetes/minikube/releases
	curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.2/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/


	curl -o ~/.kubectl_aliases https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases
	echo -e '\n [ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases' >> ~/.zshrc
	

.PHONY: linux
linux:
ifeq ($(shell uname),Linux)
	@echo 'linux is in place'

	# https://github.com/ahmetb/kubectx
	sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
	sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
	sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
	sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kctx
	sudo ln -s /opt/kubectx/kubens /usr/local/bin/kns

endif

.PHONY: mac
mac:
ifeq ($(shell uname),Darwin)
	@echo 'mac is in place'
	brew update

	brew install kubernetes-helm

	# https://github.com/ahmetb/kubectx
	brew install kubectx --with-short-names

	# https://github.com/jonmosco/kube-ps1
	brew install kube-ps1

	cat <<EOF >> ~/.zshrc
		source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
		PROMPT='$(kube_ps1)'$PROMPT
	EOF

	# asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
	echo -e '\n$HOME/.asdf/asdf.sh' >> ~/.zshrc
	echo -e '\n$HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
	brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
	

	# https://github.com/kubernetes/minikube
	asdf plugin-add minikube
	asdf install minikube 0.25.2
	asdf global minikube 0.25.2



	brew install git
	brew install heroku/brew/heroku

	brew install node@8
	brew link --overwrite node@8
	# react
	npm install -g create-react-app
	npm install -g eslint

	#photo viewer
	http://phiewer.com/wp-content/uploads/Phiewer-1.8.2.dmg

endif
	

