FROM arm32v6/alpine:edge

LABEL AUTHOR=Blademainer<blademainer@gmail.com>

RUN apk update && apk add wget bash curl gnupg --no-cache

WORKDIR /app

#AriaNg
RUN curl -s https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest | grep "browser_download_url.*zip" | grep "linux-arm.zip" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
 && unzip *-linux-arm.zip && rm *-linux-arm.zip \
 && cd BaiduPCS-Go-*-linux-arm \
 && mv BaiduPCS-Go .. && cd .. \
 && mv BaiduPCS-Go baidupcs \
 && chmod +x baidupcs

EXPOSE 5299

CMD "/app/baidupcs"


