#
# K2HDKC DBaaS on Kubernetes Command Line Interface - K2HR3 CLI Plugin
#
# Copyright 2021 Yahoo! Japan Corporation.
#
# K2HDKC DBaaS is a DataBase as a Service provided by Yahoo! JAPAN
# which is built K2HR3 as a backend and provides services in
# cooperation with Kubernetes.
# The Override configuration for K2HDKC DBaaS serves to connect the
# components that make up the K2HDKC DBaaS. K2HDKC, K2HR3, CHMPX,
# and K2HASH are components provided as AntPickax.
#
# For the full copyright and license information, please view
# the license file that was distributed with this source code.
#
# AUTHOR:   Takeshi Nakatani
# CREATE:   Wed Sep 15 2021
# REVISION:
#

#--------------------------------------------------------------
# Load Option name for DBaaS
#--------------------------------------------------------------
if [ -f "${LIBEXECDIR}/${K2HR3CLI_MODE}/options.sh" ]; then
	. "${LIBEXECDIR}/${K2HR3CLI_MODE}/options.sh"
fi
if [ -f "${LIBEXECDIR}/${K2HR3CLI_MODE}/constvariables.sh" ]; then
	. "${LIBEXECDIR}/${K2HR3CLI_MODE}/constvariables.sh"
fi

#---------------------------------------------------------------------
# Put Help
#---------------------------------------------------------------------
# [NOTE]
# Adjust the start and end positions of the characters according to the
# scale below, and arrange the lines.
#
#     +-- start position(ex. title)
#     |   +-- indent for description
#     |   |
#     v   v
#     +---+----+----+----+----+----+----+----+----+----+----+----+----|
#
echo ""
echo "K2HDKC DBaaS on Kubernetes CLI command - K2HDKC Cluster"
echo "    See https://dbaas.k2hdkc.antpick.ax/"
echo ""
echo "${K2HR3CLI_MODE} is a command that operates for K2HDKC DBaaS on Kubenetes"
echo "with K2HR3 system."
echo "${K2HR3CLI_MODE} has the \"${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CONFIG}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3}\" and \"${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC}\" submode,"
echo "and these submode has some subcommand for each."
echo ""
echo "CONFIGRATION: Configuration for Database on Kubernetes"
echo "    This command is one of K2HR3 CLI command for the Manipulating the"
echo "    Configuration file for Database on Kubernetes."
echo "    This command has \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_LIST}\" and \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}\" submode."
echo ""
echo "  LIST: List Configurations"
echo "    Lists the currently existing domains configurations for K2HDKC"
echo "    DBaaS K8S."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CONFIG} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_LIST}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CONFIG} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_LIST}"
echo ""
echo "  SHOW: Show Configuration"
echo "    Displays the contents of the specified configuration of DBaaS K8S."
echo "    The contents of the configuration are displayed by \"KEY\" and \"VALUE\"."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CONFIG} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CONFIG} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW} <options>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        *) For \"domain name\", specify the domain name listed by the"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_LIST} command."
echo "           The \"domain name\" can be specified separately for the"
echo "           domain name of the kubernetes cluster and the namespece."
echo ""
echo "CERTIFICATES: Certificates for Database on Kubernetes"
echo "    This command is to operate the certificate used by K2HDKC"
echo "    DBaaS K8S."
echo "    This command has \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SET}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}\" and \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE}\" submode."
echo ""
echo "  SHOW: Show Certificates"
echo "    Displays a list of certificates for the specified K2HDKC"
echo "    DBaaS K8S cluster(domain) or the contents of the"
echo "    certificates."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW} <options> <cert file>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        *) If <cert file> is not specified, the certificates will"
echo "           be listed. If <cert file> is specified, the existence"
echo "           of the certificate is confirmed and the contents are"
echo "           displayed."
echo ""
echo "  SET: Set Certificates"
echo "    Set certificates for the specified the one of host(node) in"
echo "    K2HR3 system in K2HDKC DBaaS K8S cluster."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SET}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SET} <options> <cert file> ..."
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG} <type>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_NAME_LONG} <K2HDKC name in K2HR3 system>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NAME_LONG} <K2HR3 API name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NAME_LONG} <K2HR3 APP name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_HOST_NUM_LONG} <host(node) number>"
echo ""
echo "        cert file:"
echo "           Specify the file path of the certificate and private"
echo "           key file to be set."
echo "           This parameter is specified differently depending on"
echo "           the value of the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG} option."
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_CA}       : create 2 files"
echo "                        <CA cert>"
echo "                        <CA private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3DKC}   : create 4 files"
echo "                        <server cert>"
echo "                        <server private key>"
echo "                        <client cert>"
echo "                        <client private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3API} : create 4 files"
echo "                        <server cert>"
echo "                        <server private key>"
echo "                        <client cert>"
echo "                        <client private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3APP} : create 2 files"
echo "                        <server cert>"
echo "                        <server private key>"
echo ""
echo "        *) Specify the following values for the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG} option."
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_CA}       : set for CA certificate"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3DKC}   : set for K2HDKC host(node) in K2HR3 system"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3API} : set for K2HR3 API host(node)"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3APP} : set for K2HR3 APP host(node)"
echo ""
echo "  CREATE(APPLY): Create Certificates"
echo "    Create/Apply certificates for the specified the one of host(node)"
echo "    in K2HR3 system in K2HDKC DBaaS K8S cluster."
echo "    This command works the same for ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE} and ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}"
echo "             ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_CERT} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}(${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}) <options>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG} <type>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_NAME_LONG} <K2HDKC name in K2HR3 system>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NAME_LONG} <K2HR3 API name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NAME_LONG} <K2HR3 APP name>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_REPS_LONG} <replica count for K2HDKC in K2HR3 system>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_REPS_LONG} <replica count for K2HR3 API>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_REPS_LONG} <replica count for K2HR3 APP>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_NODE_IPS_LONG} <kubernetes node host IP addresses(default=null)>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_C_LONG} <country for certificate(default=\"JP\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_S_LONG} <sate for certificate(default=\"Tokyo\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_O_LONG} <organaization for certificate(default=\"AntPickax\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CA_PASS_LONG} <passphrase for CA certificate(default=null)>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_EXPIRE_LONG} <perid years for certificate(default=5)>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_MINIKUBE_LONG}"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_FORCE_LONG}"
echo ""
echo "        create certificate files:"
echo "           The following certificate files are created according"
echo "           to ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG}."
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_ALL}      : all the following files"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_CA}       : specify 2 file"
echo "                        <CA cert>"
echo "                        <CA private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3DKC}   : specify 4 file"
echo "                        <server cert>"
echo "                        <server private key>"
echo "                        <client cert>"
echo "                        <client private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3API} : specify 4 file"
echo "                        <server cert>"
echo "                        <server private key>"
echo "                        <client cert>"
echo "                        <client private key>"
echo "             ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3APP} : specify 2 file"
echo "                        <server cert>"
echo "                        <server private key>"
echo ""
echo "        *) Specify the following values for the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG} option."
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_ALL}      : create all certificates"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_CA}       : create for CA certificate"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3DKC}   : create for K2HDKC host(node) in K2HR3 system"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3API} : create for K2HR3 API host(node)"
echo "           ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3APP} : create for K2HR3 APP host(node)"
echo ""
echo "        *) About ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_NODE_IPS_LONG}"
echo "           Specify the IP address of the host(node) in the"
echo "           Kubernetes cluster."
echo "           Set to the certificate SAN when accessing the K2HDKC,"
echo "           K2HR3 API, and K2HR3 APP systems from within a"
echo "           Kubernetes cluster via these node's IP address."
echo "           You can omit this option if you do not need it."
echo ""
echo "        *) About ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_MINIKUBE_LONG}"
echo "           Specify this option when building K2HD KC DBaaS K8S"
echo "           in a minikube environment."
echo "           Register the IP address of the minikube host in the"
echo "           certificate SAN to access the K2HR3 system from"
echo "           outside the host running minikube."
echo ""
echo "        *) About ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_FORCE_LONG}"
echo "           This command does not create a certificate if it"
echo "           already exists."
echo "           Specify this option if you already have the"
echo "           certificate but want to recreate it."
echo ""
echo "K2HR3 SYSTEM: K2HR3 system for Database on Kubernetes"
echo "    This command is to operate the K2HR3 system in K2HDKC DBaaS"
echo "    K8S."
echo "    This command has \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}\" and \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE}\" submode."
echo ""
echo "  SHOW: Show K2HR3 system information"
echo "    Displays infomration for K2HR3 system in K2HDKC DBaaS K8S."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW} <options>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_CONFIG_LONG}"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_SUMMARY_LONG}"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_RES_LONG}"
echo ""
echo "  CREATE(APPLY): Create/Apply K2HR3 system"
echo "    Start or apply the K2HR3 system of K2HDKC DBaaS K8S."
echo "    This command works the same for ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE} and ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}"
echo "             ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}(${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}) <options>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_NAME_LONG} <K2HDKC name in K2HR3 system>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NAME_LONG} <K2HR3 API name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NAME_LONG} <K2HR3 APP name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_REPS_LONG} <replica count for K2HDKC in K2HR3 system>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_REPS_LONG} <replica count for K2HR3 API>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_REPS_LONG} <replica count for K2HR3 APP>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NPNUM_LONG} <node port number for K2HR3 API(default=null)>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NPNUM_LONG} <node port number for K2HR3 APP(default=null)>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_CLIENT_SECRET_LONG} <OIDC Client Secret>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_CLIENT_ID_LONG} <OIDC Client ID>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_ISSUER_URL_LONG} <OIDC Issuer URL>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_USERNAME_KEY_LONG} <Username key name in OIDC Token>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_COOKIENAME_LONG} <Cookie name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_COOKIE_EXPIRE_LONG} <Cookie expire(sec)>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SUSPEND_LONG}"
echo ""
echo "        Specify the following options for creating a certificate:"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_EP_LONG} <endpoint IP address for K2HR3 API(default=null)>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_EP_LONG} <endpoint IP address for K2HR3 APP(default=null)>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_NODE_IPS_LONG} <kubernetes node host IP addresses(default=null)>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_C_LONG} <country for certificate(default=\"JP\")>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_S_LONG} <sate for certificate(default=\"Tokyo\")>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_O_LONG} <organaization for certificate(default=\"AntPickax\")>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CA_PASS_LONG} <passphrase for CA certificate(default=null)>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_EXPIRE_LONG} <perid years for certificate(default=5)>"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_MINIKUBE_LONG}"
echo "          ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_FORCE_LONG}"
echo ""
echo "  DELTE: Delete K2HR3 system"
echo "    Delete K2HR3 system in K2HDKC DBaaS K8S."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HR3} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE} <options>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_RM_CERTS_LONG}"
echo ""
echo "K2HDKC CLUSTER: Operate K2HDKC Cluster as DBaaS on Kubernetes"
echo "    This command is to operate a K2HDKC cluster as Database as a"
echo "    Service(DBaaS) on the Kubernetes system."
echo "    This command has \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SCALE}\" and \"${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE}\" submode."
echo ""
echo "  SHOW: Show K2HDKC Cluster"
echo "    Displays infomration for K2HDKC Cluster as DBaaS."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SHOW} <options> <cluster name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_CONFIG_LONG}"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_RES_LONG}"
echo ""
echo "        cluster name:"
echo "            Specify the name of the cluster for which you want to"
echo "            display information. If the cluster name is omitted,"
echo "            it lists the existing cluster names."
echo ""
echo "  SETUP: Setup K2HR3 data for K2HDKC Cluster"
echo "    Setup the data in K2HR3 to create a K2HDKC cluster."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SETUP}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SETUP} <options> <cluster name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_COMMAND_OPT_UNSCOPED_TOKEN_LONG}(${K2HR3CLI_COMMAND_OPT_UNSCOPED_TOKEN_SHORT}) <k2hr3 unscoped token>"
echo "          or"
echo "        ${K2HR3CLI_COMMAND_OPT_OIDC_TOKEN_LONG}(${K2HR3CLI_COMMAND_OPT_OIDC_TOKEN_SHORT}) <OpenID Connect(OIDC) token>"
echo ""
echo "        cluster name:"
echo "            Specify the name of the cluster, This name is used"
echo "            by the K2HDKC DBaaS K8S to recognize the cluster and"
echo "            as a base for names such as related nodes and"
echo "            resources."
echo ""
echo "  CREATE(APPLY): Create/Apply K2HDKC Cluster"
echo "    Start or apply the K2HDKC DBaaS K8S cluster."
echo "    This command works the same for ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE} and ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}"
echo "             ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_CREATE}(${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_APPLY}) <options> <cluster name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_CNT_LONG} <server node count>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SLV_CNT_LONG} <slave node count>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_PORT_LONG} <server node port number>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_CTLPORT_LONG} <server node control port number>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SLV_CTLPORT_LONG} <slave node control port number>"
echo ""
echo "        cluster name:"
echo "            Specify the name of the cluster, This name is used"
echo "            by the K2HDKC DBaaS K8S to recognize the cluster and"
echo "            as a base for names such as related nodes and"
echo "            resources."
echo ""
echo "  SCALE: Scale K2HDKC Cluster"
echo "    Scale In/Out the K2HDKC DBaaS K8S cluster."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SCALE}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_SCALE} <options> <cluster name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_CNT_LONG} <server node count>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SLV_CNT_LONG} <slave node count>"
echo ""
echo "        cluster name:"
echo "            Specify the name of the cluster, This name is used"
echo "            by the K2HDKC DBaaS K8S to recognize the cluster and"
echo "            as a base for names such as related nodes and"
echo "            resources."
echo ""
echo "  DELETE: Delete K2HDKC Cluster"
echo "    Delete the K2HDKC DBaaS K8S cluster."
echo ""
echo "      USAGE: ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE}"
echo ""
echo "      ${BINNAME} ${K2HR3CLI_MODE} ${K2HR3CLI_DBAAS_K8S_COMMAND_SUB_K2HDKC} ${K2HR3CLI_DBAAS_K8S_COMMAND_EXEC_DELETE} <options> <cluster name>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG} <full domain name(default=\"default.svc.cluster.local\")>"
echo "          or"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} <kubernetets namespace(default=\"default\")>"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} <kubernates cluster domain(default=\"svc.cluster.local\")>"
echo ""
echo "        cluster name:"
echo "            Specify the name of the cluster, This name is used"
echo "            by the K2HDKC DBaaS K8S to recognize the cluster and"
echo "            as a base for names such as related nodes and"
echo "            resources."
echo ""
echo "COMMON OPTION:"
echo "    The following options are available for all commands."
echo "    Some options can be stored in configuration."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CONFIG_LONG}"
echo "        Specify the configuration directory path that has files"
echo "        such as templates used by DBaaS K8S."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG}"
echo "        Specifies the domain name to build the K2HDKC DBaaS"
echo "        cluster."
echo "        The domain name must consist of the domain name and"
echo "        namespace of the kubernetes cluster."
echo "          \"domain name\" = \"k8s namespace\" . \"k8s cluester domain name\""
echo "        This option is exclusive with the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG}"
echo "        and ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} options."
echo "        If not specified, the value of the environment variable"
echo "        or configuration will be used. If neither has a value,"
echo "        \"default.svc.cluster.local\" is used as the default value."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG}"
echo "        Specifies a part of the domain name to build the"
echo "        K2HDKC DBaaS cluster."
echo "        This option specifies the namespace for the kubernetes"
echo "        cluster. The value of this option and the value of the"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} option combine to form the domain name."
echo "        The ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG} option is required if specify"
echo "        this option. It is also exclusive with the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG}"
echo "        option."
echo "        If not specified, the value of the environment variable"
echo "        or configuration will be used. If neither has a value,"
echo "        \"default\" is used as the default value."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SDOMAIN_LONG}"
echo "        Specifies a part of the domain name to build the"
echo "        K2HDKC DBaaS cluster."
echo "        This option specifies the domain name for the kubernetes"
echo "        cluster. The value of this option and the value of the"
echo "        ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} option combine to form the domain"
echo "        name. The ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8SNAMESPACE_LONG} option is required if"
echo "        specify this option. It is also exclusive with the ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_DOMAIN_LONG}"
echo "        option."
echo "        If not specified, the value of the environment variable"
echo "        or configuration will be used. If neither has a value,"
echo "        \"svc.cluster.local\" is used as the default value."
echo ""
echo "OPTION:"
echo "    ${K2HR3CLI_COMMON_OPT_HELP_LONG}(${K2HR3CLI_COMMON_OPT_HELP_SHORT})"
echo "        Display ${K2HR3CLI_MODE} command help."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_LONG}"
echo "        K2HDKC DBaaS Specifies the type of certificate used by the K8S"
echo "        cluster."
echo "        Specify \"${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_ALL}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_CA}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3DKC}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3API}\", \"${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_TYPE_R3APP}\" as the"
echo "        value."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_NAME_LONG}"
echo "        Specifies the name of the K2HDKC cluster on the K2HR3 system used"
echo "        by the K2HDKC DBaaS K8S cluster."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NAME_LONG}"
echo "        Specifies the name of the K2HR3 API on the K2HR3 system used"
echo "        by the K2HDKC DBaaS K8S cluster."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NAME_LONG}"
echo "        Specifies the name of the K2HR3 APP on the K2HR3 system used"
echo "        by the K2HDKC DBaaS K8S cluster."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_HOST_NUM_LONG}"
echo "        Specifies the name number of hosts(k2hdkc/k2hr3api/k2hr3app)"
echo "        that make up the K2HR3 system used by the K2HDKC DBaaS K8S"
echo "        cluster."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3DKC_REPS_LONG}"
echo "         Specifies the number of K2HDKC server nodes that make"
echo "         up the K2HR3 system for the K2HDKC DBaaS K8S."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_REPS_LONG}"
echo "         Specifies the number of K2HR3 API nodes that make up"
echo "         the K2HR3 system for the K2HDKC DBaaS K8S."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_REPS_LONG}"
echo "         Specifies the number of K2HR3 APP nodes that make up"
echo "         the K2HR3 system for the K2HDKC DBaaS K8S."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_EP_LONG}"
echo "         Specifies the endpoint for external access to the Kubernetes"
echo "         cluster of K2HR3 API host that make up K2HR3 system in the"
echo "         K2HDKC DBaaS K8S."
echo "         You can specify multiple IP addresses or FQDN, and more than"
echo "         one by separating them with commas(,)."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_EP_LONG}"
echo "         Specifies the endpoint for external access to the Kubernetes"
echo "         cluster of K2HR3 APP host that make up K2HR3 system in the"
echo "         K2HDKC DBaaS K8S."
echo "         You can specify multiple IP addresses or FQDN, and more than"
echo "         one by separating them with commas(,)."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3API_NPNUM_LONG}"
echo "         K2HDKC DBaaS Specifies the NodePort number settings for the"
echo "         K2HR3 API of the K8S."
echo "         If not specified, kubernetes will give you the"
echo "         appropriate port number."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_R3APP_NPNUM_LONG}"
echo "         K2HDKC DBaaS Specifies the NodePort number settings for the"
echo "         K2HR3 APP of the K8S."
echo "         If not specified, kubernetes will give you the"
echo "         appropriate port number."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_NODE_IPS_LONG}"
echo "         Specifies the IP address of the Node host on which the K2HR3"
echo "         systems that make up the K2HDKC DBaaS K8S are laid out."
echo "         You can specify multiple IP addresses, separated by commas."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_MINIKUBE_LONG}"
echo "         Specify this option when building K2HDKC DBaaS K8S on minikube."
echo "         If this option is specified, the IP address of the \"minikube ip\""
echo "         command result is added to \"SAN\" in the certificate."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_FORCE_LONG}"
echo "         Specify this when creating a certificate by overwriting"
echo "         even if an existing certificate exists."
echo "         By default, the certificate is not created if it exists."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SUSPEND_LONG}"
echo "         K2HDKC DBaaS Specifies not to start the K2HR3 API/APP"
echo "         process when starting the K2HR3 system of K8S."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_C_LONG}"
echo "         Specify the value to be set for Country in the Subject"
echo "         of the certificate."
echo "         If omitted, it will be \"JP\"."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_S_LONG}"
echo "         Specify the value to be set for Sate in the Subject"
echo "         of the certificate."
echo "         If omitted, it will be \"Tokyo\"."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_O_LONG}"
echo "         Specify the value to be set for Organaization in the"
echo "         Subject of the certificate."
echo "         If omitted, it will be \"AntPickax\"."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CA_PASS_LONG}"
echo "         Set the passphrase when creating the CA certificate."
echo "         Alternatively, when creating another certificate using a CA"
echo "         certificate, specify the passphrase for that CA certificate."
echo "         If this value is omitted, the certificate will be created"
echo "         without a passphrase(not recommended)."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CERT_EXPIRE_LONG}"
echo "         When creating CA certificates and other certificates, set"
echo "         the expiration date of those certificates in years."
echo "         The default value is 5 years."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_CONFIG_LONG}"
echo "         Specify this to display Configuration information."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_RES_LONG}"
echo "         Specify this to display the resource information of"
echo "         Kubnernetes."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_SHOW_SUMMARY_LONG}"
echo "         Specify this to display the summay information of"
echo "         K2HR3 system and K2HDKC DBaaS."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_RM_CERTS_LONG}"
echo "         This option also deletes the self-signed CA certificate"
echo "         and certificate when destroying the K2HR3 system."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_CLIENT_SECRET_LONG}"
echo "         K2HDKC DBaaS If you are working with a K8S K2HR3 system"
echo "         with an OpenID Connect(OIDC) system, specify OIDC"
echo "         CLIENT SECRET."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_CLIENT_ID_LONG}"
echo "         K2HDKC DBaaS If you are working with a K8S K2HR3 system"
echo "         with an OpenID Connect(OIDC) system, specify OIDC"
echo "         CLIENT ID."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_ISSUER_URL_LONG}"
echo "         K2HDKC DBaaS If you are working with a K8S K2HR3 system"
echo "         with an OpenID Connect(OIDC) system, specify OIDC"
echo "         ISSURE URL."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_USERNAME_KEY_LONG}"
echo "         K2HDKC DBaaS When the K2HR3 system of K8S is linked with"
echo "         the OpenID Connect(OIDC) system, if the OIDC access"
echo "         token has a user name field, specify the field name."
echo "         If the field does not exist, leave it unspecified."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_COOKIENAME_LONG}"
echo "         K2HDKC DBaaS When the K8S K2HR3 system is linked with"
echo "         the OpenID Connect(OIDC) system, the OIDC access token"
echo "         is temporarily stored in a cookie."
echo "         Specify the name of the cookie to store, if omitted, use"
echo "         \"ID_TOKEN\"."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_OIDC_COOKIE_EXPIRE_LONG}"
echo "         K2HDKC DBaaS When the K8S K2HR3 system is linked with"
echo "         the OpenID Connect (OIDC) system, the OIDC access token"
echo "         is temporarily stored in a cookie."
echo "         Specify the expiration date for this storage in seconds."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8S_API_URL_LONG}"
echo "         Specify the URL of the kubernetes API."
echo "         If not specified, \"https://kubernetes.default.svc\" will"
echo "         be used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8S_CA_CERT_LONG}"
echo "         Specify the CA certificate for the kubernetes API."
echo "         If not specified, \"/var/run/secrets/kubernetes.io/serviceaccount/ca.crt\""
echo "         will be used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_K8S_SA_TOKEN_LONG}"
echo "         Specify the Token for the kubernetes API."
echo "         If not specified, \"/var/run/secrets/kubernetes.io/serviceaccount/token\""
echo "         will be used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_PORT_LONG}"
echo "         Specifies the port number of the server node used in"
echo "         the K2HDKC DBaaS cluster."
echo "         If omitted, port 8020 is used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_CTLPORT_LONG}"
echo "         Specifies the controle port number of the server node"
echo "         used in the K2HDKC DBaaS cluster."
echo "         If omitted, port 8021 is used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SLV_CTLPORT_LONG}"
echo "         Specifies the controle port number of the slave node"
echo "         used in the K2HDKC DBaaS cluster."
echo "         If omitted, port 8022 is used."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SVR_CNT_LONG}"
echo "         Specifies the number of servers that make up a K8S"
echo "         K2HDKC DBaaS cluster."
echo ""
echo "    ${K2HR3CLI_DBAAS_K8S_COMMAND_OPT_CLUSTER_SLV_CNT_LONG}"
echo "         Specifies the number of slaves that make up a K8S"
echo "         K2HDKC DBaaS cluster."
echo ""

#
# Local variables:
# tab-width: 4
# c-basic-offset: 4
# End:
# vim600: noexpandtab sw=4 ts=4 fdm=marker
# vim<600: noexpandtab sw=4 ts=4
#