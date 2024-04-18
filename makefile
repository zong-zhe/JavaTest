init:
	mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

deploy:	
	mvn deploy:deploy-file -Dfile=~/windows-x86_64-local-staging/*.jar -DgroupId=com.mycompany -DartifactId=myartifact -Dversion=1.0 -Dpackaging=jar -DrepositoryId=github -Durl=https://maven.pkg.github.com/zong-zhe/lib \

deploy1:	
	mvn deploy -s settings.xml