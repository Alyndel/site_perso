function verif(num)
{
	var verif;
	verif = confirm('Êtes-vous sûr de bien vouloir supprimer cet agent ?');
	if (verif==true) 
	{
		document.getElementById('t_gestion_agents').deleteRow(num.parentNode.parentNode.rowIndex);
	}
	return verif;
}