FROM arm64v8/alpine:edge

LABEL AUTHOR=Blademainer<blademainer@gmail.com>

RUN apk update && apk add wget bash curl gnupg --no-cache

WORKDIR /app

#AriaNg
RUN curl -s https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest | grep "browser_download_url.*zip" | grep "linux-arm64.zip" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
 && unzip *-linux-arm64.zip && rm *-linux-arm64.zip \
 && cd BaiduPCS-Go-*-linux-arm64 \
 && mv BaiduPCS-Go .. && cd .. \
 && mv BaiduPCS-Go baidupcs \
 && chmod +x baidupcs

EXPOSE 5299

CMD "/app/baidupcs"


