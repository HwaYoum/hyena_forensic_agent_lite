FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
      file bsdmainutils coreutils findutils grep ripgrep less \
      pst-utils pff-tools catdoc antiword poppler-utils \
      unzip p7zip-full sqlite3 \
      libimage-exiftool-perl libemail-outlook-message-perl \
      python3 python3-pip locales \
 && sed -i '/ko_KR.UTF-8/s/^# //' /etc/locale.gen && locale-gen \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --break-system-packages \
      openpyxl xlsx2csv pandas docx2txt python-pptx extract-msg pyhwp

COPY osint /opt/osint
RUN chmod +x /opt/osint/geo /opt/osint/insta /opt/osint/submit /opt/osint/ocr /opt/osint/stt \
 && ln -s /opt/osint/geo /opt/osint/insta /opt/osint/submit /opt/osint/ocr /opt/osint/stt /usr/local/bin/

WORKDIR /case
