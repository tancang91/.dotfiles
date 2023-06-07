#!/usr/bin/env bash

host=$1
java_home="/usr/lib/jvm/default"

openssl s_client -showcerts -connect ${host}:9092 </dev/null 2>/dev/null | openssl x509 -outform PEM > "/tmp/${host}.pem"
${java_home}/bin/keytool -import -trustcacerts -file "/tmp/${host}.pem" -alias ${host} -keystore ${java_home}/lib/security/cacerts
rm "/tmp/${host}.pem"
