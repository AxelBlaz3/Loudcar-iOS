//
//  HomeViewModel.swift
//  Loudcar
//
//  Created by Karthik on 26/04/21.
//

import Foundation
import CoreBluetooth

class HomeViewModel: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var peripherals: [CBPeripheral] = []
    var centralManager: CBCentralManager!
    
    func scanLeDevices() {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Reject if the signal strength is too low to attempt data transfer.
        // Change the minimum RSSI value depending on your app’s use case.
        guard RSSI.intValue >= -50
            else {
                print("Discovered perhiperal not in expected range, at %d", RSSI.intValue)
                return
        }
        
        print("Discovered %s at %d", String(describing: peripheral.name), RSSI.intValue)
        
        // Device is in range - have we already seen it?
        if !self.peripherals.contains(peripheral) {
            peripherals.append(peripheral)
            
            // And finally, connect to the peripheral.
            print("Connecting to perhiperal -", peripheral)
            centralManager.connect(peripheral, options: nil)
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
}
