FROM jitsi/web:stable-5765-1

# Copy custom configuration for Lefebvre, which have been extracted from jitsi/web:stable-5142 image
COPY interface_config.js /defaults
# TODO Delete or improve CSS based on stable-5765-1 image
#COPY all.css /usr/share/jitsi-meet/css
# Copy custom title
COPY title.html /usr/share/jitsi-meet/title.html
# favicon downloaded from https://assets.lefebvre.es/media/favicon.ico
COPY favicon.ico /usr/share/jitsi-meet/images
# Copy config.js and resources for redirect URL on hangup
COPY config.js /defaults
COPY static/thank-you-page.html /usr/share/jitsi-meet/static/close2.html
RUN mkdir /usr/share/jitsi-meet/static/css /usr/share/jitsi-meet/static/images
COPY static/css/* /usr/share/jitsi-meet/static/css
COPY static/images/* /usr/share/jitsi-meet/static/images
RUN sed -i -e 's/document.title=`${this.props._roomName} | ${interfaceConfig.APP_NAME}`/document.title=`${interfaceConfig.APP_NAME} | ${this.props._roomName}`/' /usr/share/jitsi-meet/libs/app.bundle.min.js