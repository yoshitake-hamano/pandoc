# pandoc 2.2.1
# Compiled with pandoc-types 1.17.4.2, texmath 0.10.1.2, skylighting 0.6
FROM ubuntu:18.10

MAINTAINER yoshitake.hamano "oed0cow6oy5@gmail.com"

RUN apt-get update -qq
RUN apt-get upgrade -qq

ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y texlive
RUN apt-get install -y texlive-lang-japanese
RUN apt-get install -y texlive-luatex
RUN apt-get install -y texlive-latex-extra
# fix "! LaTeX Error: File `xunicode.sty' not found."
RUN apt-get install -y texlive-xetex
RUN apt-get install -y fontforge
RUN apt-get install -y wget unzip
RUN apt-get install -y git

# fonts
RUN git clone --depth=1 git://github.com/google/fonts.git
RUN cp fonts/ofl/inconsolata/*.ttf /usr/share/fonts/truetype/
RUN wget 'https://osdn.net/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F63545%2Fmigu-1m-20150712.zip' -O migu-1m-20150712.zip
RUN unzip migu-1m-20150712.zip
RUN cp migu-1m-20150712/*.ttf /usr/share/fonts/truetype/
RUN git clone --depth=1 git://github.com/chitoku-k/Ricty.git
RUN cd Ricty; sh ricty_generator.sh auto
RUN cp Ricty/*.ttf /usr/share/fonts/truetype/

# pandoc
RUN apt-get install -y pandoc pandoc-citeproc python-pandocfilters
RUN apt-get install -y python-pygraphviz
RUN apt-get install -y software-properties-common
RUN apt-get install -y plantuml
RUN apt-get install -y python-pip
RUN pip install pandocfilters
RUN pip install pandoc-plantuml-filter


# Cleaning
RUN apt-get clean

VOLUME /workspace
WORKDIR /workspace
