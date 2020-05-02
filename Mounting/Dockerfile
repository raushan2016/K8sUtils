
FROM azuresdk/azure-cli-python
ADD model_download.sh /
RUN chmod +x /model_download.sh
ADD model_service.sh /
RUN chmod +x /model_service.sh
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

