# Circadian_Rhythms
Mentored by Dr. Casey Diekman and Soheil Saghafi, I participated in this biomathematical research which involved using deepHM provided by IBM to analyze carcardian rhythms

Abstract:
Using Deep Hybrid Modeling to Identify Biophysical Mechanisms Underlying Circadian Rhythms in Cardiac Arrhythmias

David Alonge, Franklyn Rodriguez Reyes, Chinonye Uzowuru
Mentor: Soheil Saghafi
Advisor: Casey Diekman
Department of Mathematical Sciences
New Jersey Institute of Technology, Newark NJ 07102

Electrical activity in the heart exhibits 24-hour rhythmicity, with sudden cardiac death more likely to occur in the morning than at other times of the day. Our daily activities and physiology are regulated by an internal biological clock known as the circadian clock. Studying how the circadian clock affects cardiac electrophysiology may give us a better understanding of why potentially fatal cardiac arrhythmias are more likely to occur at certain times of the day. Electrocardiogram (ECG) recordings are used to evaluate the heart’s functionality. Hayter et al. developed MATLAB functions to analyze human ECG recordings and extract features such as  the QT interval (see Figure 1). They observed day/night differences in these feature values. We hypothesize that the circadian variation in these ECG features can be explained by circadian rhythms in cardiac ion channel conductances. Our goal is to explore the relationship between ion channel conductances and ECG features using a Deep Hybrid Model that combines mechanistic modeling with deep learning. Our mechanistic model is a set of ordinary differential equations (ODEs) that simulate cardiac action potentials and our deep learning approach involves conditional Generative Adversarial Networks (cGANs). We used the DeepHM software package provided by IBM Research to create an inverse surrogate model trained to identify the conductance parameter regions of the mechanistic model that correspond to the distribution of QT intervals extracted from the original data. Then by providing QT intervals recorded during the day and at night for a given patient we can check how the cGAN maps these feature values to parameter space and learn how certain ion channel conductances are changing across the circadian cycle.

 
