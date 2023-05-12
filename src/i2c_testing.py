import smbus
import struct
from dataclasses import dataclass

@dataclass
class TelemetryPackage:
    coolant_temp: float
    oil_pressure: float
    battery_voltage: float
    lambda_sensor: float
    engine_speed: float
    throttle_pos: float
    wheel_speed_l: float
    wheel_speed_r: float

bus = smbus.SMBus(0)    # 0 = /dev/i2c-0 (port I2C0), 1 = /dev/i2c-1 (port I2C1)

DEVICE_ADDRESS = 0x08      #7 bit address (will be left shifted to add the read write bit)
REGISTER_ADDRESS = 0x00

# Read 32 bytes into struct
telemetry_values = [0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff]
bus.read_i2c_block_data(DEVICE_ADDRESS, REGISTER_ADDRESS, telemetry_values)


print(telemetry_values)