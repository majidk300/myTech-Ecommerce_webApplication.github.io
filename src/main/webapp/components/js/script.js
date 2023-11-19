function add_to_cart(pId, pName, pPrice) {

    let cart = localStorage.getItem("cart");

    if (cart == null) {

        let products = [];
        let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};

        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
//        console.log("Product is added first time");
        
        showToast("Item is added to cart");

    } else {

        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pId);
        //old products 
        if (oldProduct) {

            //increase quantity of same product
            oldProduct.productQuantity = oldProduct.productQuantity + 1;

            pcart.map((item) => {

                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }

            });

            localStorage.setItem("cart", JSON.stringify(pcart));

//            console.log("Product quantity is increase")
            showToast("Product quantity is increase "+"( "+ oldProduct.productQuantity +" )");
            
        } else {

//             Add new product- not present products
            let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
            showToast("Product is added to cart");
        }

    }

    updateCart();
    
    
}

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart == null || cart.length == 0) {

        console.log("Cart is empty !!");
        $(".cart-items").html("( 0 )");
        $(".card-body-modal").html("<h4>Cart does not have any items </h4>");
        $(".checkout-btn").attr('disabled',true);
    } else {
//        there is present items
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        $(".card-body-modal").html(`(${cart.length})`);

        let table = `
              <table class='table'>
        
             <thead class='thead-light'>
             
             <tr>
                 <th>Item Name</th>
                 <th>Price</th>
                 <th>Quantity</th>
                 <th>Total Price</th>
                 <th>Action</th>
             </tr>
            
            
            </thead>
         
        `;

        let totalPrice = 0;
        cart.map((item) => {

            table += `
                 <tr>
                <td> ${item.productName}</td>
                <td> ${item.productPrice}</td>
                <td> ${item.productQuantity}</td>
                <td> ${item.productPrice*item.productQuantity}</td>
                <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
           
          `;
            
            totalPrice+=item.productPrice*item.productQuantity;

        });
        
        table = table + `
        <tr><td colspan='5' style='font-weight:bold; text-align:right!important'>Toatal Price : ${totalPrice}</td></tr>
       </table>`;

        $(".card-body-modal").html(table);
        $(".checkout-btn").attr('disabled',false);
    }

}

function deleteItemFromCart(pId){
    
   let cart =  JSON.parse(localStorage.getItem(('cart')));
   let newcart = cart.filter((item)=>item.productId!=pId);
   
   localStorage.setItem('cart',JSON.stringify(newcart));
   
   updateCart();
   
   showToast("Item is remove from cart");
}

$(document).ready(function () {
    updateCart();
});

//Toast Message 
function showToast(content){
    $("#toast").addClass("display");
     $("#toast").html(content);
        setTimeout(()=>{
          $("#toast").removeClass("display");  
        },2000);
        
    }
    
function goToCheckOut(){
    window.location.href="checkout.jsp";
}
    