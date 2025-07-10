# Slim-NOF

Para ejecutar todos los yaml:
``` bash
for ncwo in ncwo1 ncwomax; do
    echo $ncwo
    cd $ncwo
    for set in Slim05 Slim16 Slim20; do
        echo $set
        cd $set
        for nof in PNOF5 PNOF7 GNOF GNOFm20 GNOFm25 GNOFa20 GNOFa25; do
            echo $nof 
            cd $nof
            julia --project=@analyzer ../../../utils/common.jl
            julia --project=@analyzer ../../../utils/cleaner.jl
            julia --project=@analyzer ../../../utils/analyzer.jl
            cd .. 
        done
        cd .. 
    done 
    cd ..
done
```

Para propagar notebooks
``` bash
for set in Slim05; do
    echo $set
    for method in PNOF5 PNOF7 GNOF GNOFm20 GNOFm25 GNOFa20 GNOFa25; do
        echo $method
        cp Slim05-GNOF-PP.ipynb ${set}-${method}-PP.ipynb 
        cp Slim05-GNOF-EP.ipynb ${set}-${method}-EP.ipynb
        sed -i -e "s/GNOF/${method}/g" ${set}-${method}-*.ipynb
    done
    sed -i -e "s/Slim05/${set}/g" ${set}-*.ipynb
done
sed -i -e "s/ncwo1/ncwomax/g" *-EP.ipynb
```

