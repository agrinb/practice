products = [{"SKU"=>"120945", "name"=>"Light", "wholesale_price"=>"2.50", "retail_price"=>"5"}, {"SKU"=>"679340", "name"=>"Medium", "wholesale_price"=>"3.25", "retail_price"=>"7.50"}, {"SKU"=>"328745", "name"=>"Bold", "wholesale_price"=>"4.75", "retail_price"=>"9.75"}]

  products.each_index do |index|
   @quant << product[index].values
 end
