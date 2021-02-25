function something()
{
	var x = window.localStorage.getItem('bbb'); // получаем значение из localStorage

	x = x * 1 + 1;								// увеличиваем это значение на 1

	window.localStorage.setItem('bbb', x);		// устанавливаем значение ключа

	alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;

	var x = window.localStorage.getItem(key);
	
	x = x * 1 + 1;

	window.localStorage.setItem(key, x);

	// вывод окошка с количеством заказанной пиццы
	alert('Items in your cart: ' + cart_get_number_of_items());

}

function cart_get_number_of_items() {

var cnt = 0;

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i); // получаем ключ
		var value = window.localStorage.getItem(key); // получаем значение в руби hh[key] = value
		if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value * 1;
		}
	}

	return cnt;
}