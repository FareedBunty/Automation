def buildAPP() {
    echo "Building the Application"
}

def testAPP() {
    echo "Testing the Application"
}

def deployAPP(version) {
    echo "Deploying the Application"
    echo "Deploying Version: ${version}" // Correct version parameter passed
}

return this
