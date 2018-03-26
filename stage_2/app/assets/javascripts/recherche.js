// alert("OUI !");

$(document).ready(function() {
    $('#tableau').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
        }
    } );
} );

// function searchbar()
// {
// 	var input, filter, table, ligne_tr, cellule, i, j, compteur;
// 	input = document.getElementById('entree_barre');
// 	filter = input.value.toUpperCase();
// 	table = document.getElementById('tableau');
// 	// cellule = ligne_tr.getElementsByTagName('td');

// 	for (i = 1; i < table.rows.length; i++)	
// 	{
// 		ligne_tr = table.rows[i];
// 		for (j = 0; j < 3; j++)
// 		{
// 			cellule = ligne_tr.cells[j];//[0];
// 			if (cellule.innerHTML.toUpperCase().indexOf(filter) > -1)
// 			{
// 				ligne_tr.style.display = "";
// 			}
// 			else
// 			{
// 				ligne_tr.style.display = "none";
// 			}
// 		}
// 	}
// }