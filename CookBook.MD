# Code Book

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals

+ Tim-Acc-XYZ
+ Time-Gyro-XYZ 

These time domain signals were captured at a constant rate of 50 Hz;
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

+ Time_Acc_XYZ (body)
+ Time_GravityAcc_XYZ (gravity)

using another low pass Butterworth filter with a corner frequency of 0.3 Hz.


# Data Dictionary

### Subjects:
+ Human subject number: 1..30 

### Activities:
+ lay
+ sit
+ stand
+ walk
+ downstairs
+ upstairs

### In the 68 variables  jolly characters _????  stay for the following alternative:

+ _mean         Mean value
+ _std          Standard deviation

### Variable

+ Time_Acc_????_XYZ
+ Time_Gyro_????_XYZ
        
The acceleration signal (Time_Acc_????_XYZ) was then separated into body and gravity acceleration signals
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

+ Time_Acc_????_XYZ
+ Time_GravityAcc_????_XYZ
        
Subsequently, the body linear acceleration and angular velocity (Time_Acc_????_XYZ) were derived in time to obtain Jerk signals

+ Time_AccJerk_????_XYZ
+ Time_GyroJerk_????_XYZ
        
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm

+ Time_AccMag_????
+ Time_GravityAccMag_????
+ Time_AccJerkMag_????
+ Time_GyroMag_????
+ Time_GyroJerkMag_????
        
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing

+ Freq_Acc_????_XYZ
+ Freq_AccJerk_????_XYZ
+ Freq_Gyro_????_XYZ
        
+ Freq_AccMag_????
+ Freq_AccJerkMag_????
+ Freq_GyroMag_????
+ Freq_GyroJerkMag_????
        
        
XYZ were is present denote XYZ directions..
