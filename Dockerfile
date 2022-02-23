FROM ruby:2.7.0
FROM node:17.1.0-slim
## nodejsとyarnはwebpackをインストールする際に必要
# yarnパッケージ管理ツールをインストール
ENV ENTRYKIT_VERSION 0.4.0

RUN apt-get update                                                                                                                      \
  && apt-get install                                                                                                                    \
    openssl                                                                                                                             \
  && wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz     \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz                                                                            \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz                                                                                   \
  && mv entrykit /bin/entrykit                                                                                                          \
  && chmod +x /bin/entrykit                                                                                                             \
  && entrykit --symlink                                                                                                                 \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash -                                                                             \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -                                                                  \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list                                      \
  && sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'                                         \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'   \
  && wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb                                                                   \
  && DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.10-1_all.deb                                                           \
  && apt-get update															\
  && apt-get remove -y															\
    libmariadbclient18															\
    libmariadbclient-dev-compat														\
    libmariadbclient-dev														\
  && apt-get install -y --allow-unauthenticated						   					                                                                  \
    libmysqlclient-dev                                                                                                                  \
    mysql-client                                                                                                                        \
    libxml2-dev                                                                                                                         \
    libxslt-dev                                                                                                                         \
    libc6-dev                                                                                                                           \
    nodejs                                                                                                                              \
    yarn                                                                                                                                \
    zip                                                                                                                                 \
    google-chrome-stable                                                                                                                \
  && gem install foreman                                                                                                                \
  && CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`                                                \
  && wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/                           \
  && unzip ~/chromedriver_linux64.zip -d ~/                                                                                             \
  && rm ~/chromedriver_linux64.zip                                                                                                      \
  && chown root:root ~/chromedriver                                                                                                     \
  && chmod 755 ~/chromedriver                                                                                                           \
  && mv ~/chromedriver /usr/bin/chromedriver                                                                                            \
  && apt-get clean

RUN mkdir /kouch
WORKDIR /kouch
COPY . /kouch
RUN bundle install
