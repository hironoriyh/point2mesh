import pymeshlab
import sys

input_file = sys.argv[1]
print(input_file)
ms = pymeshlab.MeshSet()
ms.load_new_mesh(input_file)

ms.load_filter_script("scripts/process_data/poisson.mlx")
ms.apply_filter_script()

print("save",input_file[:-4]+".xyz" )
ms.save_current_mesh(input_file[:-4]+".xyz")