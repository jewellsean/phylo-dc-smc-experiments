## Setup wrun group
EXPERIMENT_DIRECTORY=/Users/jewellsean/research/experiments/remote/phylo-dc-smc-experiments
CODE_DIRECTORY=/Users/jewellsean/research/phylo-dc-smc/


cd $EXPERIMENT_DIRECTORY
wrun-init -sshRemoteHost grex -codeRepository $CODE_DIRECTORY

## Setup code repo and build app
cd $CODE_DIRECTORY
wrun-add-build-command
wrun-self-build

## Create data repo within experiments directory
cd $EXPERIMENT_DIRECTORY
mkdir data

## Create data trees
java -cp $CODE_DIRECTORY/build/install/phylo-dc-smc/lib/\* \
cherry.SimulateTrees \
-rootDirectory $EXPERIMENT_DIRECTORY/data/ \
-rand 10

## Generate plans
mkdir plans/run
cd plans/templates
./generatePlans.sh
cd $EXPERIMENT_DIRECTORY

## Launch templates
./sendPlans.sh