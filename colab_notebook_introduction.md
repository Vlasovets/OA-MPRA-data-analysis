## Introduction to Colab Notebooks
During this tutorial, we will use Google Colab Notebooks to run the MPRAsnakeflow pipeline. Google Colab Notebooks are a free, cloud-based Jupyter notebook environment that allows you to write and execute Python code. A more indepth guide can be found [here](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html). The notebooks are stored in your Google Drive and can be shared just like Google Docs or Sheets. You can mount your Google Drive to the notebook and access your files from there which will be covered in the following tutorial. 

### Setting up a Google Colab Notebook with access to the Google Drive folder
1. Go to your google Drive and click on the `Shared with me` folder.
2. You should find there the folder which was shared with you (`MPRA-IGVF-Workshop-2024`). Click on it ("right click") and then click on `Add shortcut to Drive`. 
3. A new folder is now created in your `My Drive` folder. You can now use this folder as if it was in your `My Drive` folder.
4. You go now to the `MPRAsnakeflow_tutorial.ipynb` notebook inside the shared folder (`/Tutorials/T2_MPRA_stats`) and open it in the google colab environment by clicking on it.
- On the top there is a task bar similar to apps like word where you can change settings like the text size or download the file.
- The main part of the window should be the notebook itself. It is divided into cells. Each cell can contain code or text. You can run a cell by clicking on the play button on the left side of the cell. The output of the cell will be displayed below the cell.
- And on the left side there is a set of logos which can be used to interact for example with the file system (the folder logo).
5. Run the first code block to mount your google drive to the notebook by clicking on the `play button`. This code block will mount your google drive to the notebook using the following code: *Attention by doing the next step you will connect google colab to your google drive. You will get asked for the authentification to do so.*
```
from google.colab import drive

drive.mount(‘/content/gdrive’)
```
6. You can now access the data folder by clicking on the folder button (in the bar on the left) and then on `gdrive` and subsequently on `My Drive` where you can find the shared folder.
7. After your google drive is mounted you can check if it worked by clicking on the folder button (it is showen on the left side and looks like a folder). 
- Click then on the `gdrive` folder. If you see the `My Drive` folder you have successfully mounted your google drive.
- Within the My Drive folder you should see the `MPRA-IGVF-Workshop-2024` folder. If you click on it you should be able to navigate to the folder of the second tutorial (`/Tutorials/T2_MPRA_stats`) where the `MPRAsnakeflow_tutorial.ipynb` and the `Analysis_data` is stored.
