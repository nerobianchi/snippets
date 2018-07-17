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

brew install 
	adr-tools \
	autoconf \
	automake \
	aws-elasticbeanstalk \
	bash \
	bash-completion \
	cairo \
	cask \
	cfssl \
	chromedriver \
	consul \
	coreutils \
	dry \
	emacs \
	fontconfig \
	freetype \
	fribidi \
	gauge \
	gcc \
	gdbm \
	gdk-pixbuf \
	gettext \
	git \
	git-flow \
	glib \
	gmp \
	gnutls \
	gobject-introspection \
	gradle \
	graphite2 \
	harfbuzz \
	heroku \
	heroku-node \
	htop \
	httpie \
	icu4c \
	isl \
	jpeg \
	jq \
	jx \
	kube-ps1 \
	kubectx \
	kubernetes-cli \
	kubernetes-helm \
	libcroco \
	libevent \
	libffi \
	libgpg-error \
	libidn2 \
	libksba \
	libmpc \
	libpng \
	librsvg \
	libtasn1 \
	libtiff \
	libtool \
	libunistring \
	libxml2 \
	libxslt \
	libyaml \
	lua \
	maven \
	minikube \
	mongodb \
	mpfr \
	nettle \
	node \
	node6-lts \
	node@6 \
	node@8 \
	ntfs-3g \
	oniguruma \
	openssl \
	openssl@1.1 \
	p11-kit \
	packer \
	packer-completion \
	pango \
	pcre \
	perl \
	phantomjs \
	pixman \
	pkg-config \
	pstree \
	putty \
	python \
	python@2 \
	readline \
	ruby \
	ruby-build \
	sbt \
	selenium-server-standalone \
	sqlite \
	switchaudio-osx \
	telnet \
	termius \
	terraform \
	tmux \
	tree \
	unixodbc \
	vim \
	watch \
	wget \
	xz \
	zsh \
	zsh-completions



	### k8s ###
	brew install kubernetes-helm

	# https://github.com/ahmetb/kubectx
	brew install kubectx --with-short-names

	# https://github.com/jonmosco/kube-ps1
	brew install kube-ps1

	cat <<EOF >> ~/.zshrc
		source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
		PROMPT='$(kube_ps1)'$PROMPT
	EOF

	# https://github.com/GoogleContainerTools/skaffold
	curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-darwin-amd64 && chmod +x skaffold && sudo mv skaffold /usr/local/bin

	### eof k8s ###


	# asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
	echo -e '\n$HOME/.asdf/asdf.sh' >> ~/.zshrc
	echo -e '\n$HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
	brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
	

	# https://github.com/kubernetes/minikube
	# asdf plugin-add minikube
	# asdf install minikube 0.25.2
	# asdf global minikube 0.25.2

	brew install git \
				 heroku/brew/heroku \
				node@8
	brew link --overwrite node@8
	# react
	npm install -g create-react-app
	npm install -g eslint

	#photo viewer
	http://phiewer.com/wp-content/uploads/Phiewer-1.8.2.dmg

	#gitignore
	npm install -g gitignore

	brew cask install charles \
		font-fira-code \
		franz \
		freemind \
		go2shell \
		hyperdock \
		keka \
		minikube \
		minishift \
		mounty \
		osxfuse \
		robo-3t \
		vagrant \
		virtualbox \
		xquartz

	# upgrade outdated
	# brew cask upgrade $(brew cask outdated | awk '{print $1}')

endif
	

