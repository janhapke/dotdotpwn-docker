FROM perl:latest

RUN curl -L http://cpanmin.us | perl - App::cpanminus

RUN cpanm Time::HiRes
RUN cpanm Socket
RUN cpanm IO::Socket
RUN cpanm IO::Socket::SSL
RUN cpanm Getopt::Std
RUN cpanm Net::FTP
RUN cpanm Bundle::LWP

WORKDIR /dotdotpwn

RUN git clone https://github.com/wireghoul/dotdotpwn.git .

ENTRYPOINT ["perl", "-I /usr/share/perl/5.28.1/CPAN/", "dotdotpwn.pl"]
