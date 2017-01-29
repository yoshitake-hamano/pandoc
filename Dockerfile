# 1.17.02
# FROM ubuntu:16.10
# can not use pandoc-plantuml-filter

# 1.16.0.2
# FROM ubuntu:16.04
# can not use pandoc-plantuml-filter

# 1.13.2.1
FROM ubuntu:15.10

MAINTAINER yoshitake.hamano "oed0cow6oy5@gmail.com"

RUN apt-get update -qq
RUN apt-get upgrade -qq

ENV HOME /root
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
RUN git clone git://github.com/google/fonts.git
RUN cp fonts/ofl/inconsolata/*.ttf /usr/share/fonts/truetype/
RUN wget 'https://osdn.net/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F63545%2Fmigu-1m-20150712.zip' -O migu-1m-20150712.zip
RUN unzip migu-1m-20150712.zip
RUN cp migu-1m-20150712/*.ttf /usr/share/fonts/truetype/
RUN git clone git://github.com/chitoku-k/Ricty.git
RUN cd Ricty; sh ricty_generator.sh auto
RUN cp Ricty/*.ttf /usr/share/fonts/truetype/

# pandoc
RUN apt-get install -y pandoc pandoc-citeproc python-pandocfilters
RUN apt-get install -y python-pygraphviz
RUN apt-get install -y software-properties-common
RUN apt-get install -y plantuml
RUN add-apt-repository 'deb http://ppa.launchpad.net/kbonne/pandoc-plantuml-filter/ubuntu utopic main'
RUN apt-get update -qq
RUN apt-get install -y --allow-unauthenticated pandoc-plantuml-filter


# Cleaning
RUN apt-get clean

VOLUME /workspace
WORKDIR /workspace
