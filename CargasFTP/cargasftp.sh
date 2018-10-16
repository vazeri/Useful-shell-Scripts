
#!/usr/bin/csh -fb
#***************************************************************************
#* Proceso para la carga de score al sFTP
#* Control de Versiones
#* Ver  Fecha     Modif.           Resp.
#* ---  --------  ---------------  ----------
#* 1    10122018  Creacion         evazquez
#*
#* Este script fue diseñado para llevar acabo la carga a un sFTP externo
#* 
#***************************************************************************

source /usr/rcvry/.cshrc

cd $CCS_TMP/
set fecha=`date +"%Y%m%d"`
set fecha1=`date +"%Y%m%d"`
set fechah=`date +"%Y%m%d %H:%M:%S"`
set arch=score$fecha1.TXT
set HOSTFTP=
set USFTP=
set PASFTP=

echo  $fechah  "Iniciando Carga a sFTP " >> $CCS_HOME/log/log.resumen_$fecha1

ftp -n $HOSTFTP  <<END_SCRIPT
quote USER $USFTP
quote PASS $PASFTP
cd entrada

put $arch
bye
END_SCRIPT

echo  $fechah  "Se finalizo la carga del archivo cifrado del score" >> $CCS_HOME/log/log.resumen_$fecha1
exit(0)
