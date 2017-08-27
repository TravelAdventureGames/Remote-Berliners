//
//  LocationDataSet.swift
//  Berliners
//
//  Created by Martijn van Gogh on 13-03-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit
import MapKit

let locationData = [
    Loc(title: Locations.pinTitle[0], locationName: Locations.pinLocation[0], descript: Locations.pinDescription[0], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[0], longitude: Locations.longitude[0]), imageName: Locations.pinImageName[0], discipline: Locations.discipline[0]),
    Loc(title: Locations.pinTitle[1], locationName: Locations.pinLocation[1], descript: Locations.pinDescription[1], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[1], longitude: Locations.longitude[1]), imageName: Locations.pinImageName[1], discipline: Locations.discipline[1]),
    Loc(title: Locations.pinTitle[2], locationName: Locations.pinLocation[2], descript: Locations.pinDescription[2], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[2], longitude: Locations.longitude[2]), imageName: Locations.pinImageName[2], discipline: Locations.discipline[2]),
    Loc(title: Locations.pinTitle[3], locationName: Locations.pinLocation[3], descript: Locations.pinDescription[3], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[3], longitude: Locations.longitude[3]), imageName: Locations.pinImageName[3], discipline: Locations.discipline[3]),
    Loc(title: Locations.pinTitle[4], locationName: Locations.pinLocation[4], descript: Locations.pinDescription[4], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[4], longitude: Locations.longitude[4]), imageName: Locations.pinImageName[4], discipline: Locations.discipline[4]),
    Loc(title: Locations.pinTitle[5], locationName: Locations.pinLocation[5], descript: Locations.pinDescription[5], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[5], longitude: Locations.longitude[5]), imageName: Locations.pinImageName[5], discipline: Locations.discipline[5]),
    Loc(title: Locations.pinTitle[6], locationName: Locations.pinLocation[6], descript: Locations.pinDescription[6], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[6], longitude: Locations.longitude[6]), imageName: Locations.pinImageName[6], discipline: Locations.discipline[6]),
    Loc(title: Locations.pinTitle[7], locationName: Locations.pinLocation[7], descript: Locations.pinDescription[7], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[7], longitude: Locations.longitude[7]), imageName: Locations.pinImageName[7], discipline: Locations.discipline[7]),
    Loc(title: Locations.pinTitle[8], locationName: Locations.pinLocation[8], descript: Locations.pinDescription[8], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[8], longitude: Locations.longitude[8]), imageName: Locations.pinImageName[8], discipline: Locations.discipline[8]),
    Loc(title: Locations.pinTitle[9], locationName: Locations.pinLocation[9], descript: Locations.pinDescription[9], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[9], longitude: Locations.longitude[9]), imageName: Locations.pinImageName[9], discipline: Locations.discipline[9]),
    Loc(title: Locations.pinTitle[10], locationName: Locations.pinLocation[10], descript: Locations.pinDescription[10], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[10], longitude: Locations.longitude[10]), imageName: Locations.pinImageName[10], discipline: Locations.discipline[10]),
    Loc(title: Locations.pinTitle[11], locationName: Locations.pinLocation[11], descript: Locations.pinDescription[11], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[11], longitude: Locations.longitude[11]), imageName: Locations.pinImageName[11], discipline: Locations.discipline[11]),
    Loc(title: Locations.pinTitle[12], locationName: Locations.pinLocation[12], descript: Locations.pinDescription[12], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[12], longitude: Locations.longitude[12]), imageName: Locations.pinImageName[12], discipline: Locations.discipline[12]),
    Loc(title: Locations.pinTitle[13], locationName: Locations.pinLocation[13], descript: Locations.pinDescription[13], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[13], longitude: Locations.longitude[13]), imageName: Locations.pinImageName[13], discipline: Locations.discipline[13]),
    Loc(title: Locations.pinTitle[14], locationName: Locations.pinLocation[14], descript: Locations.pinDescription[14], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[14], longitude: Locations.longitude[14]), imageName: Locations.pinImageName[14], discipline: Locations.discipline[14]),
    Loc(title: Locations.pinTitle[15], locationName: Locations.pinLocation[15], descript: Locations.pinDescription[15], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[15], longitude: Locations.longitude[15]), imageName: Locations.pinImageName[15], discipline: Locations.discipline[15]),
    Loc(title: Locations.pinTitle[16], locationName: Locations.pinLocation[16], descript: Locations.pinDescription[16], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[16], longitude: Locations.longitude[16]), imageName: Locations.pinImageName[16], discipline: Locations.discipline[16]),
    Loc(title: Locations.pinTitle[17], locationName: Locations.pinLocation[17], descript: Locations.pinDescription[17], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[17], longitude: Locations.longitude[17]), imageName: Locations.pinImageName[17], discipline: Locations.discipline[17]),
    Loc(title: Locations.pinTitle[18], locationName: Locations.pinLocation[18], descript: Locations.pinDescription[18], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[18], longitude: Locations.longitude[18]), imageName: Locations.pinImageName[18], discipline: Locations.discipline[18]),
    Loc(title: Locations.pinTitle[19], locationName: Locations.pinLocation[19], descript: Locations.pinDescription[19], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[19], longitude: Locations.longitude[19]), imageName: Locations.pinImageName[19], discipline: Locations.discipline[19]),
    Loc(title: Locations.pinTitle[20], locationName: Locations.pinLocation[20], descript: Locations.pinDescription[20], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[20], longitude: Locations.longitude[20]), imageName: Locations.pinImageName[20], discipline: Locations.discipline[20]),
    Loc(title: Locations.pinTitle[21], locationName: Locations.pinLocation[21], descript: Locations.pinDescription[21], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[21], longitude: Locations.longitude[21]), imageName: Locations.pinImageName[21], discipline: Locations.discipline[21]),
    Loc(title: Locations.pinTitle[22], locationName: Locations.pinLocation[22], descript: Locations.pinDescription[22], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[22], longitude: Locations.longitude[22]), imageName: Locations.pinImageName[22], discipline: Locations.discipline[22]),
    Loc(title: Locations.pinTitle[23], locationName: Locations.pinLocation[23], descript: Locations.pinDescription[23], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[23], longitude: Locations.longitude[23]), imageName: Locations.pinImageName[23], discipline: Locations.discipline[23]),
    Loc(title: Locations.pinTitle[24], locationName: Locations.pinLocation[24], descript: Locations.pinDescription[24], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[24], longitude: Locations.longitude[24]), imageName: Locations.pinImageName[24], discipline: Locations.discipline[24]),
    Loc(title: Locations.pinTitle[25], locationName: Locations.pinLocation[25], descript: Locations.pinDescription[25], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[25], longitude: Locations.longitude[25]), imageName: Locations.pinImageName[25], discipline: Locations.discipline[25]),
    Loc(title: Locations.pinTitle[26], locationName: Locations.pinLocation[26], descript: Locations.pinDescription[26], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[26], longitude: Locations.longitude[26]), imageName: Locations.pinImageName[26], discipline: Locations.discipline[26]),
    Loc(title: Locations.pinTitle[27], locationName: Locations.pinLocation[27], descript: Locations.pinDescription[27], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[27], longitude: Locations.longitude[27]), imageName: Locations.pinImageName[27], discipline: Locations.discipline[27]),
    Loc(title: Locations.pinTitle[28], locationName: Locations.pinLocation[28], descript: Locations.pinDescription[28], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[28], longitude: Locations.longitude[28]), imageName: Locations.pinImageName[27], discipline: Locations.discipline[28]),
    Loc(title: Locations.pinTitle[29], locationName: Locations.pinLocation[29], descript: Locations.pinDescription[29], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[29], longitude: Locations.longitude[29]), imageName: Locations.pinImageName[29], discipline: Locations.discipline[29]),
    Loc(title: Locations.pinTitle[30], locationName: Locations.pinLocation[30], descript: Locations.pinDescription[30], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[30], longitude: Locations.longitude[30]), imageName: Locations.pinImageName[30], discipline: Locations.discipline[30]),
    Loc(title: Locations.pinTitle[31], locationName: Locations.pinLocation[31], descript: Locations.pinDescription[31], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[31], longitude: Locations.longitude[31]), imageName: Locations.pinImageName[31], discipline: Locations.discipline[31]),
    Loc(title: Locations.pinTitle[32], locationName: Locations.pinLocation[32], descript: Locations.pinDescription[32], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[32], longitude: Locations.longitude[32]), imageName: Locations.pinImageName[32], discipline: Locations.discipline[32]),
    Loc(title: Locations.pinTitle[33], locationName: Locations.pinLocation[33], descript: Locations.pinDescription[33], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[33], longitude: Locations.longitude[33]), imageName: Locations.pinImageName[33], discipline: Locations.discipline[33]),
    Loc(title: Locations.pinTitle[34], locationName: Locations.pinLocation[34], descript: Locations.pinDescription[34], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[34], longitude: Locations.longitude[34]), imageName: Locations.pinImageName[34], discipline: Locations.discipline[34]),
    Loc(title: Locations.pinTitle[35], locationName: Locations.pinLocation[35], descript: Locations.pinDescription[35], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[35], longitude: Locations.longitude[35]), imageName: Locations.pinImageName[35], discipline: Locations.discipline[35]),
    Loc(title: Locations.pinTitle[36], locationName: Locations.pinLocation[36], descript: Locations.pinDescription[36], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[36], longitude: Locations.longitude[36]), imageName: Locations.pinImageName[36], discipline: Locations.discipline[36]),
    Loc(title: Locations.pinTitle[37], locationName: Locations.pinLocation[37], descript: Locations.pinDescription[37], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[37], longitude: Locations.longitude[37]), imageName: Locations.pinImageName[37], discipline: Locations.discipline[37]),
    Loc(title: Locations.pinTitle[38], locationName: Locations.pinLocation[38], descript: Locations.pinDescription[38], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[38], longitude: Locations.longitude[38]), imageName: Locations.pinImageName[38], discipline: Locations.discipline[38]),
    Loc(title: Locations.pinTitle[39], locationName: Locations.pinLocation[39], descript: Locations.pinDescription[39], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[39], longitude: Locations.longitude[39]), imageName: Locations.pinImageName[39], discipline: Locations.discipline[39]),
    Loc(title: Locations.pinTitle[40], locationName: Locations.pinLocation[40], descript: Locations.pinDescription[40], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[40], longitude: Locations.longitude[40]), imageName: Locations.pinImageName[40], discipline: Locations.discipline[40]),
    Loc(title: Locations.pinTitle[41], locationName: Locations.pinLocation[41], descript: Locations.pinDescription[41], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[41], longitude: Locations.longitude[41]), imageName: Locations.pinImageName[41], discipline: Locations.discipline[41]),
    Loc(title: Locations.pinTitle[42], locationName: Locations.pinLocation[42], descript: Locations.pinDescription[42], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[42], longitude: Locations.longitude[42]), imageName: Locations.pinImageName[42], discipline: Locations.discipline[42]),
    Loc(title: Locations.pinTitle[43], locationName: Locations.pinLocation[43], descript: Locations.pinDescription[43], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[43], longitude: Locations.longitude[43]), imageName: Locations.pinImageName[43], discipline: Locations.discipline[43]),
    Loc(title: Locations.pinTitle[44], locationName: Locations.pinLocation[44], descript: Locations.pinDescription[44], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[44], longitude: Locations.longitude[44]), imageName: Locations.pinImageName[44], discipline: Locations.discipline[44]),
    Loc(title: Locations.pinTitle[45], locationName: Locations.pinLocation[45], descript: Locations.pinDescription[45], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[45], longitude: Locations.longitude[45]), imageName: Locations.pinImageName[45], discipline: Locations.discipline[45]),
    Loc(title: Locations.pinTitle[46], locationName: Locations.pinLocation[46], descript: Locations.pinDescription[46], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[46], longitude: Locations.longitude[46]), imageName: Locations.pinImageName[46], discipline: Locations.discipline[46]),
    Loc(title: Locations.pinTitle[47], locationName: Locations.pinLocation[47], descript: Locations.pinDescription[47], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[47], longitude: Locations.longitude[47]), imageName: Locations.pinImageName[47], discipline: Locations.discipline[47]),
    Loc(title: Locations.pinTitle[48], locationName: Locations.pinLocation[48], descript: Locations.pinDescription[48], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[48], longitude: Locations.longitude[48]), imageName: Locations.pinImageName[48], discipline: Locations.discipline[48]),
    Loc(title: Locations.pinTitle[49], locationName: Locations.pinLocation[49], descript: Locations.pinDescription[49], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[49], longitude: Locations.longitude[49]), imageName: Locations.pinImageName[49], discipline: Locations.discipline[49]),
    Loc(title: Locations.pinTitle[50], locationName: Locations.pinLocation[50], descript: Locations.pinDescription[50], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[50], longitude: Locations.longitude[50]), imageName: Locations.pinImageName[50], discipline: Locations.discipline[50]),
    Loc(title: Locations.pinTitle[51], locationName: Locations.pinLocation[51], descript: Locations.pinDescription[51], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[51], longitude: Locations.longitude[51]), imageName: Locations.pinImageName[51], discipline: Locations.discipline[51]),
    Loc(title: Locations.pinTitle[52], locationName: Locations.pinLocation[52], descript: Locations.pinDescription[52], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[52], longitude: Locations.longitude[52]), imageName: Locations.pinImageName[52], discipline: Locations.discipline[52]),
    Loc(title: Locations.pinTitle[53], locationName: Locations.pinLocation[53], descript: Locations.pinDescription[53], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[53], longitude: Locations.longitude[53]), imageName: Locations.pinImageName[53], discipline: Locations.discipline[53]),
    Loc(title: Locations.pinTitle[54], locationName: Locations.pinLocation[54], descript: Locations.pinDescription[54], coordinate: CLLocationCoordinate2D(latitude: Locations.latitude[54], longitude: Locations.longitude[54]), imageName: Locations.pinImageName[54], discipline: Locations.discipline[54])]







