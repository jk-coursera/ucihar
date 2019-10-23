# UCI HAR Dataset Summary

## About

These values are derived from the UCI HAR Dataset. This dataset is summarized by subject ID and activity name.

## Variables

### `Subject.ID`

A unique ID for each participant in the study.

### `Activity.Name`

The name of the activity the subject was undertaking during the measurement period.

Valid values for `Activity.Name` are:

* `WALKING`
* `WALKING_UPSTAIRS`
* `WALKING_DOWNSTAIRS`
* `SITTING`
* `STANDING`
* `LAYING`

### Other Observational Variables 

Each observational variable is the `mean` of the observed value for the given `Subject.ID`-`Activity.Name` group.

The names of these variables are broken into four parts separated by `.`s: 

1. The domain of the variable observed
    * `Time.Domain` - a variable in the time domain.
    * `Frequency.Domain` - a transformed (FFT) version of the time domain variable.
2. Measurement value
    * `Body.Acceleration` - the acceleration experienced by the phone, filtered to remove acceleration due to gravity.
    * `Body.Acceleration.Jerk` - the computed slope of `Body.Acceleration`.
    * `Body.Gyro` - the angular acceleration experienced by the phone.
    * `Body.Gryo.Jerk` - the computed slope of `Body.Gyro`.
    * `Gravity.Acceleration` - the acceleration due to gravity.
3. Measurement type
    * `Mean` - the mean value of the observed variable.
    * `Std.Dev` - the standard deviation of the observed variable.
4. Measurement Axis
    * `X.Axis` - measurement made with respect to the x-axis.
    * `Y.Axis` - measurement made with respect to the y-axis.
    * `Z.Axis` - measurement made with respect to the z-axis.

The complete list of observed variables are:

* `Time.Domain.Body.Acceleration.Mean.X.Axis`
* `Time.Domain.Body.Acceleration.Mean.Y.Axis`
* `Time.Domain.Body.Acceleration.Mean.Z.Axis`
* `Time.Domain.Body.Acceleration.Std.Dev.X.Axis`
* `Time.Domain.Body.Acceleration.Std.Dev.Y.Axis`
* `Time.Domain.Body.Acceleration.Std.Dev.Z.Axis`
* `Time.Domain.Gravity.Acceleration.Mean.X.Axis`
* `Time.Domain.Gravity.Acceleration.Mean.Y.Axis`
* `Time.Domain.Gravity.Acceleration.Mean.Z.Axis`
* `Time.Domain.Gravity.Acceleration.Std.Dev.X.Axis`
* `Time.Domain.Gravity.Acceleration.Std.Dev.Y.Axis`
* `Time.Domain.Gravity.Acceleration.Std.Dev.Z.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Mean.X.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Mean.Y.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Mean.Z.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Std.Dev.X.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Std.Dev.Y.Axis`
* `Time.Domain.Body.Acceleration.Jerk.Std.Dev.Z.Axis`
* `Time.Domain.Body.Gyro.Mean.X.Axis`
* `Time.Domain.Body.Gyro.Mean.Y.Axis`
* `Time.Domain.Body.Gyro.Mean.Z.Axis`
* `Time.Domain.Body.Gyro.Std.Dev.X.Axis`
* `Time.Domain.Body.Gyro.Std.Dev.Y.Axis`
* `Time.Domain.Body.Gyro.Std.Dev.Z.Axis`
* `Time.Domain.Body.Gyro.Jerk.Mean.X.Axis`
* `Time.Domain.Body.Gyro.Jerk.Mean.Y.Axis`
* `Time.Domain.Body.Gyro.Jerk.Mean.Z.Axis`
* `Time.Domain.Body.Gyro.Jerk.Std.Dev.X.Axis`
* `Time.Domain.Body.Gyro.Jerk.Std.Dev.Y.Axis`
* `Time.Domain.Body.Gyro.Jerk.Std.Dev.Z.Axis`
* `Frequency.Domain.Body.Acceleration.Mean.X.Axis`
* `Frequency.Domain.Body.Acceleration.Mean.Y.Axis`
* `Frequency.Domain.Body.Acceleration.Mean.Z.Axis`
* `Frequency.Domain.Body.Acceleration.Std.Dev.X.Axis`
* `Frequency.Domain.Body.Acceleration.Std.Dev.Y.Axis`
* `Frequency.Domain.Body.Acceleration.Std.Dev.Z.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Mean.X.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Mean.Y.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Mean.Z.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Std.Dev.X.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Std.Dev.Y.Axis`
* `Frequency.Domain.Body.Acceleration.Jerk.Std.Dev.Z.Axis`
* `Frequency.Domain.Body.Gyro.Mean.X.Axis`
* `Frequency.Domain.Body.Gyro.Mean.Y.Axis`
* `Frequency.Domain.Body.Gyro.Mean.Z.Axis`
* `Frequency.Domain.Body.Gyro.Std.Dev.X.Axis`
* `Frequency.Domain.Body.Gyro.Std.Dev.Y.Axis`
* `Frequency.Domain.Body.Gyro.Std.Dev.Z.Axis`

