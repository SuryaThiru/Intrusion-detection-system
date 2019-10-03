# INTRUSION DETECTION SYSTEM

## INTRODUCTION



Intrusion detection plays a vital role in the network defense process by aiming
security administrators in forewarning them about malicious behaviors such as
intrusions, attacks, and malware. IDS is a mandatory line of defense for protecting
critical networks against ever evolving issues of intrusive activities. Research in IDS
has, hence, flourished over the years. An Intrusion detection system or IDS is a system
developed to monitor ​ for suspicious activity and issues alerts when such activity is
discovered. The primary aim of IDS is to detect anomalous activities, but some
systems are also able to take action against these intrusions like blocking traffic from
the suspicious IP address. An IDS can also be used to help analyze the quantity and
types of attacks. Organizations can use this data to change their security systems or
implement more effective systems. An IDS can also help organisations to identify
bugs or problems with their network device configurations. These metrics can then be
used to predict future risks​ . ​ On the down side, IDS is also prone to giving false alarms,
this is in part due to insufficient data in data sets. Intrusion detection systems detect
these intrusions in different ways.

* A network intrusion detection system (NIDS): It is deployed at strategic points
in the network. It monitors inbound and outbound traffic from all devices on
the network.

* Host intrusion detection systems (HIDS): It ​ runs on all computers or devices
in the network with direct access to both the internet and the enterprise internal
network. HIDS can detect anomalous network packets that originate from
inside the organization or malicious traffic that a NIDS fails to detect. It may
also be able to identify malicious traffic that originates from the host itself, as
when the host has been infected with malware and is attempting to spread to
other systems.

* Signature-based intrusion detection systems: It monitors all the packets
traversing the network and compares them against a database of signatures or
attributes of known threats, similar to antivirus software.

* Anomaly-based intrusion detection systems: It monitors network traffic and
compare it to an already established baseline, to determine what is considered
6normal for the network with respect to bandwidth, protocols, ports and other
devices. This type of IDS alerts administrators to malicious activity.


## PROBLEM STATEMENT

Many IDS suffer from high false positives and a lot of research goes
into trying to reduce this high false positive rate. . We believe that intrusion
detection is a data analysis process and can be studied as a problem of
classifying data correctly. From this standpoint, it can also be observed that
any classification scheme is as good as the data presented to it as input. Hence,
it can be said that the cleaner the data is the more accurate the results will be.
From this point of view, extracting specific features that contribute more to
demarcating the normal data from the abnormal data will increase processing
speed and efficiency as well as memory usage.

## DATASET

We use the CICIDS17 dataset for this project. The dataset ​ contains benign and
the most up-to-date common attacks, which resembles real-world data. It also
includes network traffic analysis results.

![This link to the CICIDS17 dataset](https://www.unb.ca/cic/datasets/ids-2017.html)

## SOLUTION

### BINARY CLASSIFICATION

The data was transformed such that all the attacks were grouped into a
superclass that corresponds to intrusion while the benign class was left as is.
We then took a subset of the data for the model building. We used knn on the
subset using validation split and scaled the data before training. We achieved
around 1 f1 score.

### MULTI-CLASS CLASSIFICATION

In this approach the complete cleaned data was used for training. We
used several algorithms with a GLM model with an f1 score of 0.67 as the
baseline model. Several algorithms suffered from the complexity and size of
the data leading to high training time and insufficient primary memory.
XGBoost models performed better than all the other models.

### MULTI-CLASS CLASSIFICATION WITH FEATURE SELECTION


The ​ **feature importances** generated from the XGBoost algorithm
based on information gain from the previous experiment were used to identify
the most useful features. Algorithms from the previous experiments was used
for training. All algorithms performed similar to the previous models with
increased speed and better memory usage.


We further used ​ **Principal Component Analysis** ​ to reduce the number
of features by taking the first few principal components. We chose the number
of principal components based on our observations from the scree plot and the
cumulative variance of each component. Even though we achieved great
reduction in the dimensionality and complexity of the data, many algorithms
performed poorly on the reduced data.




## RESULT

### BINARY CLASSIFICATION


| KNN           |               |
| ------------- |  -------------|
| TRAIN         | 1             | 
| TEST          | 1             |


###  MULTICLASS CLASSIFICATION



| XGBOOST       |               |
| ------------- |  -------------|
| TRAIN         | 0.97          | 
| TEST          | 0.93          |



###  MULTI-CLASS CLASSIFICATION WITH FEATURE SELECTION




| XGBOOST WITH IMPORTANT FEATURES |    |
| ------------- |  -------------|
| TRAIN         | 0.97          | 
| TEST          | 0.93          |


| KNN  WITH IMPORTANT FEATURES         |  |
| ------------- |  -------------|
| TRAIN         | 0.92             | 
| TEST          | 0.89            |


| XGBOOST WITH PCA |    |
| ------------- |  -------------|
| TRAIN         | 0.92          | 
| TEST          | 0.5          |


## CONCLUSION AND FUTURE WORK

Results from the analysis of the CICIDS17 dataset shows that it is an excellent
dataset to test and simulate IDS performance. It is evident from the results that
multi-class classification with feature selection results in a high accuracy and reduces
the detection time.
For future work, researchers should study the possibility of applying techniques to use a model that can work in real time.
