from scipy.io import savemat
from numpy import array, shape
from os.path import basename
from glob import glob
import xlrd

for num, fname in enumerate(glob('*.xls')):
    wb = xlrd.open_workbook(fname)
    sh = wb.sheet_by_index(0)

    vars = sh.row_values(0)

    data = array([[(float(j) if j else 0) for j in sh.row_values(i)] for i in range(1, sh.nrows)], dtype=float)

    num_rows, num_cols = shape(data)

    savemat(basename(fname)+'.mat',
            {str(vars[i]).strip('_').replace('(','')
             .replace(')','').replace(' ', '_')+'_'+str(num):data[:,i]
             for i in range(num_cols)})
