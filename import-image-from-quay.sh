
# First you need a secret, here I used robot account secret I created with Quay

oc apply -f mmartofe-wally-secret.yml
oc secrets link default mmartofe-wally-pull-secret --for=pull

oc import-image mmartofe/spring-boot-quay:latest --from=quay.io/mmartofe/spring-boot:latest --confirm

# Create new application with the immage defined

oc new-app --name spring-boot-demo --docker-image=quay.io/mmartofe/spring-boot:latest
oc expose service/spring-boot-demo

oc label deployment/spring-boot-demo app.kubernetes.io/part-of=SPRING_BOOT_DEMO_APP --overwrite
oc label deployment/spring-boot-demo app.openshift.io/runtime=spring --overwrite

echo
echo "Try now to hit your Spring Boot service at:"
echo
echo "   http://"`oc get route spring-boot -o template --template='{{ .spec.host }}'`
echo

