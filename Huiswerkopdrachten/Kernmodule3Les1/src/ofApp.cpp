#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetCircleResolution(50);
    
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(ofColor::orange);
    ofDrawCircle(100, 100, population_NL[yearIndex] * 5);
    
    ofSetColor(ofColor::red);
    ofDrawCircle(100, 300, population_AU[yearIndex] * 5);
    
    ofSetColor(ofColor::yellow);
    ofDrawCircle(100, 500, population_ZH[yearIndex] * 5);
    
    //1820, 1910, 1945, 1968, 2005
    
    ofSetColor(ofColor::black);

    ofDrawBitmapString(years[yearIndex], mouseX - 10, mouseY - 10);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    yearIndex = ofMap(x, 0, ofGetWidth(), 0, 5);
    
    mouseX = x;
    mouseY = y;
}
