
INPUT="./03_pointmesh/corner5.ply"

python scripts/process_data/poisson_disk.py $INPUT

INPUT="${INPUT%.*}.xyz"
HULL="${INPUT%.*}_hull.obj"
SAVEDIR="${INPUT%.*}/" #${INPUT%/*}

# if [ ! -f $INPUT ]
# then
    # echo "$INPUT not found" && \
    python scripts/process_data/convex_hull.py --i $INPUT --manifold-path /tmp/Manifold/build/ --faces 5000
# fi

python main.py --input-pc $INPUT \
--initial-mesh $HULL \
--save-path $SAVEDIR \
--iterations 1000 \
--export-interval 200