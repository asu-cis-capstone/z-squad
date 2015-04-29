<?php
	function add_to_cart($product_id, $quantity)
	{
		if($product_id < 1 || $quantity < 1)
		{
			return;
		}

		if(is_array($_SESSION['cart']))
		{
			$exists_results = product_exists($product_id);
			$exists = $exists_results[0];
			$position = $exists_results[1];

			if($exists)
			{
				$new_quantity = intval($_SESSION['cart'][$position]['quantity']);
				$new_quantity++;
				$_SESSION['cart'][$position]['quantity'] = $new_quantity;
			}
			else
			{
				$max = count($_SESSION['cart']);
				$_SESSION['cart'][$max]['productid'] = $product_id;
				$_SESSION['cart'][$max]['quantity'] = $quantity;
			}
		}
		else
		{
			$_SESSION['cart'] = array();
			$_SESSION['cart'][0]['productid'] = $product_id;
			$_SESSION['cart'][0]['quantity'] = $quantity;
		}
	}

?>