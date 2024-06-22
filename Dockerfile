FROM haskell

WORKDIR /workspace

RUN apt update && \
    apt install -y ghc git

RUN git clone https://github.com/egison/egison.git

WORKDIR /workspace/egison

RUN stack --install-ghc build

RUN stack install

WORKDIR /code

COPY bin .

CMD "./run.sh"