FROM eastendboys.azurecr.io/msr-base:10.11.0.1

COPY --chown=sagadmin:sagadmin ./E2EMonitoring/ /opt/softwareag/E2EMonitoring/
COPY --chown=sagadmin:sagadmin ./E2EMonitoring/agent/plugins/uhm-onpremise-is-plugin.jar /opt/softwareag/IntegrationServer/lib/jars/
COPY --chown=sagadmin:sagadmin ./E2EMonitoring/agent/config/e2ecustomlog4j2.properties /opt/softwareag/IntegrationServer/
COPY --chown=sagadmin:sagadmin ./packages/Devtest/ /opt/softwareag/IntegrationServer/packages/Devtest/
COPY --chown=sagadmin:sagadmin ./packages/Petshop_EEBoys/ /opt/softwareag/IntegrationServer/packages/Petshop_EEBoys/
COPY --chown=sagadmin:sagadmin ./packages/Petshop_EEBoys_Connection/ /opt/softwareag/IntegrationServer/packages/Petshop_EEBoys_Connection/
COPY --chown=sagadmin:sagadmin ./integrationlive/ /opt/softwareag/IntegrationServer/config/integrationlive/
COPY --chown=sagadmin:sagadmin ./Database/postgresql-42.3.1.jar /opt/softwareag/IntegrationServer/packages/WmJDBCAdapter/code/jars/static
COPY --chown=sagadmin:sagadmin ./licenseKey.xml /opt/softwareag/IntegrationServer/config/licenseKey.xml

RUN echo $'\n\
JAVA_UHM_OPTS="-javaagent:../E2EMonitoring/agent/uhm-apm-agent.jar=logging.dir=./logs/ -Xbootclasspath/a:../E2EMonitoring/agent/uhm-apm-agent.jar" \n\
JAVA_CUSTOM_OPTS="${JAVA_CUSTOM_OPTS} ${JAVA_UHM_OPTS}" \n\
JAVA_CUSTOM_OPTS="${JAVA_CUSTOM_OPTS} -Dlog4j.configurationFile=./e2ecustomlog4j2.properties"' >> /opt/softwareag/IntegrationServer/bin/setenv.sh