#!/bin/bash
INPUT="./03_pointmesh/corner5.ply"



INPUT2="${INPUT%.*}.xyz"
HULL="${INPUT%.*}_hull.obj"
SAVEDIR="${INPUT%.*}_upsample/" #${INPUT%/*}


if [ ! -e $INPUT2 ]; then
    echo "$INPUT2 not found" && \
    python scripts/process_data/poisson_disk.py $INPUT
    else
        echo "$INPUT2 found"
fi

if [ ! -e $HULL ]; then
    echo "$HULL not found" && \
    python scripts/process_data/convex_hull.py --i $INPUT2 --manifold-path /tmp/Manifold/build/ --faces 5000
    else
        echo "$HULL found"
fi


python main.py --input-pc $INPUT2 \
--initial-mesh $HULL \
--save-path $SAVEDIR \
--iterations 5000 \
--export-interval 500 \
--max-faces 20000 \
# --begin-samples 3000 \
--upsamp 100 \
# --beamgap-iterations 300