# Project_Breast_Cancer_Data_Set
 This project was developed in one of the courses offered by the Data Science Academy and aims to perform attribute engineering on the data present in the data set using the SQL languagem.
 
This project was done in the SGBD MySQL.

 About Data Set:

This is one of three domains provided by the Oncology Institute that has repeatedly appeared in the machine learning literature. (See also lymphography and primary-tumor.)

This data set includes 201 instances of one class and 85 instances of another class. The instances are described by 9 attributes, some of which are linear and some are nominal.

The data set is public and is available at the link: https://archive.ics.uci.edu/ml/datasets/Breast+Cancer


The project have as goal realize this acts:

- Perform binarization of the class variable (0/1)
- Perform the binarization of the radiating (0/1)
- Perform node_caps binarization (0/1)
- Categorization of the breast variable (E/D)
- Categorization of the tumor_size variable (6 categories)
- Carry out the label encoding of the quadrant variable (1,2,3,4,5)
- Apply label encoding to the menopause variable
- Create a new column called position_tumor by concatenating the columns inv_nodes and quadrant.
- Apply One-Hot-Encoding to column deg_malig.