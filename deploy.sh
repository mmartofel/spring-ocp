oc delete all --selector app=spring-boot
oc delete bc/spring-boot
oc delete is/spring-boot

sleep 10

oc new-build --name spring-boot --binary --strategy docker

# Run build from your local directory that contains your Spring Boot source
oc start-build spring-boot --from-dir=.

sleep 180

oc new-app spring-boot

oc expose service/spring-boot

oc label deployment/spring-boot app.kubernetes.io/part-of=SPRING_BOOT_DEMO_APP --overwrite
oc label deployment/spring-boot app.openshift.io/runtime=spring --overwrite

echo
echo "Try now to hit your Spring Boot service at:"
echo
echo "   http://"`oc get route spring-boot -o template --template='{{ .spec.host }}'`
echo
