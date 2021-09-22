# Analysis-on-Current-Flow-Style-for-Vehicle-Alternator-Fault-Prediction

#### Graduate Thesis Research, [*School of Mechatronic Engineering*](https://mechatronic.unimap.edu.my/), *Universiti Malaysia Perlis, Malaysia*

**[Analysis on Current Flow Style for Vehicle Alternator Fault Prediction](https://iopscience.iop.org/article/10.1088/1757-899X/670/1/012042/meta)**
 
1. Introduction

Vehicle alternator is only seen as fragment piece in vehicle. This project will analyse the vehicle alternator current output flow style. A study on charging rate onto battery can be made based on this analyst. From this a prediction can be made on the vehicle alternator health and may prevent it from affecting other charging system component.


2. Methodology 

Features extracted from the raw sample data are root mean square (RMS), waveform length (WL) and autoregressive (AR). These features will then go through normality test to find the sample is normally distributed or not. The normality test used in this experiment is Jarque-Bera (JB) test. After go through the normality test, it shows that need to continue with non-parametric test. Because JB test shows that p-value is less than 0.05 confidence level. 

Kruskal-Wallis is used as non-parametric data validation.  In this test, the hypothesized value is the value is the median instead of the mean as in Analysis if Variance (ANOVA). The Kruskal-Wallis test evaluates for any significance difference in the population medians on a dependent variable across all levels of a factor. For classification K-Nearest Neighbour (KNN) is used to find the number of K to differentiate between classes. After that the K value is use in Holdout method for training and testing.


3. Results and Discussions

In KNN the parameter to find classification is K value tested from K=1 to K=10. For holdout method, it is tested for 10 times and the average accuracy is then accumulated in Table 1.

![knn](https://user-images.githubusercontent.com/84698964/134270087-5352271f-2d7a-4e5d-a37f-fc9577f61977.PNG)


Figure 1 is the K value for KNN where it has been tested from K=1 to K=10 and fine the best accuracy. 
Later then holdout method will come around to find out the distribution accuracy. The holdout method 
is done for 10 times then get the average accuracy.

![holdout](https://user-images.githubusercontent.com/84698964/134270244-ffa5f77c-a461-4ec8-b5e4-90427c456d11.PNG)

Final result shows that the accuracy of this machine learning tools is 94%. This number is a good percentage to be able to called as vehicle alternator fault prediction.


4. Conclusions

Based on the normality test, the findings are that the data is not normally distributed. Jarque-Bera test is the chosen normality test. Therefore, it must go to non-parametric test. There are a lot of type of parametric test but the chosen one Kruskal-Wallis for the non-parametric data validation. 

For non-parametric classification, K-Nearest Neighbour is chosen among other method. This is to find the number of K so the class can be differentiating. The test is done for 10 times and the number of K is trained by using cross validation technique which is Holdout method. For Holdout method there is 3 type of Holdout setting used. Which is 60-40, 70-30 and 80-20. 










**Keywords:** K-Nearest Neighbors / Statitical Analysis / MATLAB / Jarque-Bera Test / Kruskal-Wallis test / Fault Prediction

**Publication:** M. A. Abd Halim, M. T. A. Rahman, N. A. Rahim, A. Rahman, A. F. A. Hamid, and N. A. 
M. Amin, “[Analysis on current flow style for vehicle alternator fault prediction](https://iopscience.iop.org/article/10.1088/1757-899X/670/1/012042/meta),” IOP Conf. 
Ser. Mater. Sci. Eng., 2019.

**Project Repository:** [Fault Prediction Analysis](https://github.com/Asmuie/Data-Science-Portfolio/tree/main/Fault%20Prediction%20Analysis)
 
