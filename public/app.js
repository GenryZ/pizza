function something()
{
	var x = window.localStorage.getItem('bbb'); // получаем значение из localStorage

	x = x * 1 + 1;								// увеличиваем это значение на 1

	window.localStorage.setItem('bbb', x);		// устанавливаем значение ключа

	alert(x);
}
function add_to_cart()
{
	alert('Hello from function!');
}