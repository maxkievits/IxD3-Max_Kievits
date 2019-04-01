#include "ofApp.h"


//--------------------------------------------------------------
void ofApp::setup(){
    

    download();
}

void ofApp::download() {
    std::string url = "http://api.maxmedia-apps.nl/treinlocaties.php";
    
    // Now parse the JSON
    bool parsingSuccessful = result.open(url);
    
    if (parsingSuccessful)
    {
        ofLogNotice("ofApp::setup") << result.getRawString();
    }
    else
    {
        ofLogNotice("ofApp::setup")  << "Failed to parse JSON" << endl;
    }
}


void ofApp::update() {

}

void ofApp::draw() {
  
    for (Json::ArrayIndex i = 0; i < result.size(); ++i)
    {
        //ofLog() << result[i]["lng"] << endl;
        
        float lat = result[i]["lat"].asFloat();
        float lng = result[i]["lng"].asFloat();
        
        //lat ongeveer 52
        
        //lng tussen 4 en 6
        
        ofDrawCircle(((lat - 45) * 100) - 200, (lng * 150) - 300, 5);
        ofSetColor(ofMap(result[i]["snelheid"].asFloat(), 0, 150, 0, 255), ofMap(result[i]["snelheid"].asFloat(), 0, 150, 255, 0), 0);
        
    }
    
}

void ofApp::keyPressed(int key) {
    download();
}

void ofApp::mouseMoved(int x, int y) {
}

