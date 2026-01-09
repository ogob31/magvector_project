import groovy.json.JsonSlurper

def pipelinesListFileName = 'pipelines_list.json'
def config = new JsonSlurper().parse(new File("${WORKSPACE}", pipelinesListFileName))

def credentialsId = 'github_cred'

// 1) Create folders listed in rbac-folders
def folders = config["rbac-folders"] ?: []
folders.each { f ->
    folder(f) {
        displayName(f)
        description("Auto-created by Seed Job from ${pipelinesListFileName}")
    }
}

// 2) Create pipeline jobs inside each folder
folders.each { f ->
    def pipelines = config[f] ?: []

    pipelines.each { p ->
        def pipelineName    = p.name
        def repoUrl         = p.repo
        def branchName      = p.branch ?: "main"
        def jenkinsfilePath = p.jenkinsfile

        def jobFullName = "${f}/${pipelineName}"

        pipelineJob(jobFullName) {
            definition {
                cpsScm {
                    scm {
                        git {
                            remote {
                                url(repoUrl)
                                credentials(credentialsId)
                            }
                            branches("*/${branchName}")
                        }
                    }
                    scriptPath(jenkinsfilePath)
                }
            }
        }
    }
}
