ARG BUILD_FROM
FROM $BUILD_FROM

COPY config.yaml /
RUN grep version < config.yaml | grep -oe '[0-9\.]*' > VERSION && rm config.yaml

RUN curl -s "https://api.github.com/repos/henrygd/beszel/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' > BESZEL_HUB_VERSION

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /
RUN curl -sL "https://github.com/henrygd/beszel/releases/latest/download/beszel-hub_$(uname -s)_$(uname -m | sed 's/x86_64/amd64/' | sed 's/armv7l/arm/' | sed 's/aarch64/arm64/').tar.gz" | tar -xz -O beszel-hub | tee ./beszel-hub >/dev/null && chmod +x beszel-hub

CMD [ "/run.sh" ]
