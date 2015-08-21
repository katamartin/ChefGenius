# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



tags = Tag.create([{ label: 'breakfast' },
                   { label: 'lunch' },
                   { label: 'dinner' },
                   { label: 'dessert' },
                   { label: 'vegetarian' },
                   { label: 'vegan' },
                   { label: 'drinks' },
                   { label: 'pasta' },
                   { label: 'seafood' },
                   { label: 'tomato' },
                   { label: 'zucchini' },
                   { label: 'salads' },
                   { label: 'eggs' },
                   { label: 'berries' },
                   { label: 'citrus' },
                   { label: 'duck' },
                   { label: 'banana' },
                   { label: 'soup' },
                   { label: 'avocado' }
                  ])
users = User.create([{
                       email: 'guest@geni.us',
                       password_digest: BCrypt::Password.create("password"),
                       session_token: SecureRandom.urlsafe_base64(16)
                     },
                     {
                       email: 'kata@geni.us',
                       password_digest: BCrypt::Password.create("password"),
                       session_token: SecureRandom.urlsafe_base64(16)
                     },
                     {
                       email: 'foodluv3r@geni.us',
                       password_digest: BCrypt::Password.create("password"),
                       session_token: SecureRandom.urlsafe_base64(16)
                     },
                     {
                       email: 'veryvegan@geni.us',
                       password_digest: BCrypt::Password.create("password"),
                       session_token: SecureRandom.urlsafe_base64(16)
                     }
                   ])
recipes = Recipe.create([{
                          author: users[1],
                          image: Image.create(url: "https://www.filepicker.io/api/file/3xleafyyRjClPSFmLGdv"),
                          title: "Zucchini and Ricotta Galette",
                          tag_ids: [1, 2, 3, 5, 11],
                          body: "Serves 6

For the pastry:
1 1/4 cups all-purpose flour, chilled in the freezer for 30 minutes
1/4 teaspoon salt
8 tablespoons (1 stick) cold unsalted butter, cut into pieces and chill again
1/4 cup sour cream
2 teaspoons fresh lemon juice
1/4 cup ice water

Filling:
1 large or 2 small zucchinis, sliced into 1/4 inch thick rounds
1 tablespoon plus 1 teaspoon olive oil
1 medium garlic clove, minced (about 1 teaspoon)
1/2 cup ricotta cheese
1/2 cup (about 1 ounce) grated Parmesan cheese
1/4 cup (1 ounce) shredded mozzarella
1 tablespoon slivered basil leaves

Glaze:
1 egg yolk beaten with 1 teaspoon water

Make dough: Whisk together the flour and salt in a large bowl. Sprinkle bits of butter over dough and using a pastry blender, cut it in until the mixture resembles coarse meal, with the biggest pieces of butter the size of tiny peas. In a small bowl, whisk together the sour cream, lemon juice and water and add this to the butter-flour mixture. With your fingertips or a wooden spoon, mix in the liquid until large lumps form. Pat the lumps into a ball; do not overwork the dough. Cover with plastic wrap and refrigerate for 1 hour.

Make filling: Spread the zucchini out over several layers of paper towels. Sprinkle with 1/2 teaspoon salt and let drain for 30 minutes; gently blot the tops of the zucchini dry with paper towels before using. In a small bowl, whisk the olive oil and the garlic together; set aside. In a separate bowl, mix the ricotta, Parmesan, mozzarella, and 1 teaspoon of the garlicky olive oil together and season with salt and pepper to taste.

Prepare galette: Preheat oven to 400 degrees. On a floured work surface, roll the dough out into a 12-inch round. Transfer to an ungreased baking sheet (though if you line it with parchment paper, it will be easier to transfer it to a plate later). Spread the ricotta mixture evenly over the bottom of the galette dough, leaving a 2-inch border. Shingle the zucchini attractively on top of the ricotta in concentric circles, starting at the outside edge. Drizzle the remaining tablespoon of the garlic and olive oil mixture evenly over the zucchini. Fold the border over the filling, pleating the edge to make it fit. The center will be open. Brush crust with egg yolk glaze.

Bake the galette until the cheese is puffed, the zucchini is slightly wilted and the galette is golden brown, 30 to 40 minutes. Remove from the oven, sprinkle with basil, let stand for 5 minutes, then slide the galette onto a serving plate. Cut into wedges and serve hot, warm or at room temperature."
                          },
                          {
                            author: users[1],
                            image: Image.create(url: "https://www.filepicker.io/api/file/ROH48ehOSlyJNrYgC9rP"),
                            title: "Tomato and Fried Provalone Sandwich",
                            tag_ids: [2, 5, 10],
                            body: "Makes 2 big sandwiches, or 4 open-faced smaller ones, tartine-style

4 1/2-inch thick slices your favorite sturdy bread*
4 tablespoons mayonnaise
Two to four 1/4-inch slices provolone cheese (use larger amount for smaller slices)
Olive oil2 medium-sized perfectly ripe tomatoes, sliced
Flaky salt and freshly cracked black pepper, to taste

Spread each slice of bread with mayonnaise and set aside.

Heat a skillet, preferably nonstick, over medium-low heat. Add a thin layer of olive oil and let it heat until shimmering. Add first slice of provone to skillet and fry it until crusty and golden underneath. Using a very thin spatula (this “flexible fish spatula” style is my favorite, for everything) carefully flip slice. It’s probably not going to flip neatly and you’ll probably curse me and also Hess but a messy slice will taste no less delicious than a photogenic one, promise. Just do your best. Fry the slice on the other side until golden underneath, then lift this browned cheese mess out of the pan and onto your first prepared bread slice. Repeat with remaining slices of cheese, frying more than one at a time if you’re now more comfortable with the process.

Arrange slices of tomatoes over fried provolone on bread, sprinkle with salt and pepper and eat with one hand while calming an irate newborn with the other (if you’re me) or with two hands, from a plate, sitting down with a napkin on your lap, you civilized thing (if you’re not me, clearly)."
                          },
                          {
                            author: users[1],
                            image: Image.create(url: "https://www.filepicker.io/api/file/eWFmdiVSwKs7pAYTGwzW"),
                            title: "Spaghetti Pangrattato",
                            tag_ids: [1, 3, 5, 8, 13],
                            body: "Serves 2, in generous heaps, or 3, petitely

Crumbs
2 tablespoon olive oil
1 large or 2 small garlic cloves, minced
1/2 cup fresh or stale coarse plain breadcrumbs (panko worked great here)
Salt and red pepper flakes, to taste
1 teaspoon fresh rosemary, minced
Few fine gratings fresh lemon zest

Crispy Egg
1 glug of olive oil per egg
3 eggs
Salt and pepper

Pasta and Assembly
8 ounces dried spaghetti
1 tablespoon olive oil
2 teaspoons small capers, drained (rinsed if salted), chopped
Handful flat-leaf parsley, chopped
1/3 cup grated Pecorino Romano cheese (optional)

Make crispy crumbs (pangrattato): Heat olive oil in a medium skillet over medium heat. Once hot, add garlic and let sizzle for barely a minute, just until it begins to turn a pale golden color. Add breadcrumbs, salt, pepper, rosemary and lemon zest and reduce heat to low, cooking mixture slowly until all of the crumbs are an even golden color, about 5 minutes. Set aside.

Cook pasta: Bring a large pot of well salted water to a generous boil and cook pasta until al dente about 1 to 2 minutes shy of package directions. Reserve 1/2 cup pasta cooking water before draining pasta.

Meanwhile, make crispy eggs: Wipe out breadcrumbs skillet. Return to stove over high heat and add a generous glug of olive oil per egg. Once hot enough that the oil begins to smoke, add egg(s). They’re going to hiss and splatter so step back as soon as you do. Spoon some of the cooking oil over the eggs, carefully. Season with salt and pepper. In 1 to 2 minutes, the egg(s) will be brown and very crisp underneath and around the edges. Shimmy a thin spatula underneath the egg(s) (a flexible fish spatula works great here), being careful not to break the yolk. If you’re cooking for someone who shouldn’t be eating runny yolks (ahem), you can flip the egg over and cook it for another 30 seconds or so before removing it. Transfer cooked egg(s) to paper towels to drain.

Assemble dish: Once pasta is drained, return it to the empty pot or a large skillet with 1 tablespoon olive oil and a splash or two (or all, if needed to loosen pasta) of reserved cooking water. Over high heat, toss with capers and parsley for 1 minute. Divide among bowls or plates. Sprinkle with Pecorino, if using, then 1/3 of breadcrumb (pangrattato) mixture. Place an egg over each dish, and break up with a fork. Eat immediately."
                            },
                            {
                              author: users[1],
                              image: Image.create(url: "https://www.filepicker.io/api/file/l1yJILGZQ2W2exPToe1A"),
                              title: "Berry Yogurt Popsicles",
                              tag_ids: [4, 14],
                              body: "Makes 10 popsicles

2 level cups fresh blackberries, or the berry of your choice
2 tablespoons (40 grams) honey
1/2 lemon or 1 small lime
1/2 cup (120 grams) water
1/2 cup (100 grams) granulated sugar
1 1/2 cups (340 grams) plain unsweetened Greek-style yogurt (1 cup fage = 227 grams)

If your berries are large, especially blackberries, cut them in half. Place berries in non-reactive (i.e. not aluminum or tin, which I suspect you weren’t using anyhow) bowl and squeeze 1 tablespoon lemon juice over it (save the peel; you’re about to use it). Add honey, stir to combine. Set aside.

Place lemon peel, water and sugar in a saucepan. Cook, stirring, until it comes to a boil and sugar has dissolved. Gently simmer for 5 minutes more. Strain out peel and chill syrup completely. You can do this in the fridge, but I find it much quicker to set the bowl of syrup in a larger bowl of ice water. Within 15 minutes, it should be quite cold to the touch.

Whisk yogurt and chilled syrup together.

Place the berry mixture and any juices that have accumulated in a blender and whirl until desired texture. (I left a few tiny chunks throughout.) If you loathe the seeds from raspberries or blackberries, puree fully and press through a fine-mesh strainer to remove seeds. Assemble popsicles by alternating pouring a little of the yogurt mixture, then a little of the berry mixture into each popsicle mold, repeating as desired until you reach 1/4-inch from the tops (to leave room for expansion as they freeze). Use a skewer to lightly swirl the mixtures together.

If using conventional molds, snap on the lid and freeze until solid, 3 to 4 hours. If using glasses or other unconventional molds, freeze until the pops are beginning to set (45 minutes to 1 hour), then insert the sticks and freeze until solid, 3 to 4 hours. If using an instant ice pop maker, follow the manufacturer’s instructions."
                              },
                              {
                                author: users[1],
                                image: Image.create(url: "https://www.filepicker.io/api/file/6ToJCqYaSa6qLPT17jt5"),
                                title: "Liège Waffles",
                                tag_ids: [1, 4],
                                body: "Makes 16 thick waffles, just about 4 inches across each.

1/2 cup (120 ml) milk, whole is ideal
1/4 cup (60 ml) water
2 tablespoons raw sugar, brown sugar or honey
1 packet (7 grams or 2 1/2 teaspoons) active dry yeast
2 large eggs, ideally at room temperature
2 teaspoons vanilla extract
3 2/3 cups (460 grams) all-purpose flour, divided
1 teaspoon coarse or kosher salt
14 tablespoons (200 grams or 7 ounces) unsalted butter, softened
1 1/3 cups pearl sugar (see Note at end for sources)

Make dough: Warm milk and water together to lukewarm, or between 110 and 116 degrees F, and place in the bottom of a large mixer bowl. Add sugar and yeast and stir to combine. Set aside for 5 minutes; the yeast should look foamy.

Whisk in eggs and vanilla, then stir in all but 1 cup flour (you can eyeball this) using a spoon or the dough hook of a stand mixer. Add the salt and mix to combine. Using the dough hook of a stand mixer, add the butter, a spoonful at a time, thoroughly kneading in each addition and scraping down the bowl as needed before adding the next until all of the butter has been mixed in. This is always my least favorite step in brioche because it feels like it takes forever to get that butter worked in, but it pays off in a stretchy, layered dough, promise. Add remaining flour and knead with dough hook on low speed for 5 minutes, or until glossy.

Set dough to rise twice: You can let the dough rise two ways, first at room temperature and then in the fridge, or vice-versa:

For room temperature first, cover bowl with plastic wrap and leave at room temperature for 2 hours; dough should double. Stir with a spoon or spatula to deflate into a mound, re-cover with plastic wrap and let chill in the fridge overnight, or up to 24 hours.

For fridge first, cover bowl with plastic warp and leave in the fridge overnight, or up to 24 hours. The dough will not look fully doubled when you take it out. The day you’d like the make the waffles, bring the dough back to room temperature for 60 minutes, stir to deflate, and let rise again for another 1 1/2 to 2 hours.

To cook the waffles: For both methods, on the day you’re ready to make the waffles, knead in the pearl sugar. It’s going to seem like way too much for the dough, but it will taste perfect once cooked. Divide dough into 16 mounds. If it’s rather warm and greasy, you can return these balls of dough to the fridge while you cook them off, one or a few at a time.

Heat your waffle iron — I use a deeper Belgian-style one here, which is ideal, but I’d expect these to work with all types — over medium heat. No need to oil or butter if it’s nonstick in good condition. Place first ball of waffle dough on grid and cook according to waffle maker’s instructions. Cook until deeply golden all over, which will take approximately 5 minutes, then carefully transfer with tongs or a fork to a cooling rack. Remember, they’re loaded with molten sugar; they’re very hot. Repeat with remaining balls of dough, adjusting temperature of waffle iron as needed to get the color you want. You’ll likely find that the waffles look more caramelized and glossy as you go on, as bits of melted sugar stay behind and gloss the next waffles; this is the best part.

Keep waffles warm in a 200 degree oven if you plan to eat them right away. As the waffles cool, they will harden and you will likely think “what a ruse! What a terrible recipe!” but the hardness comes from that melted sugar firming up, and will soften again when you rewarm them. These waffles should always be eaten warm.

To serve: You can serve these any number of ways: with ice cream or whipped cream, Nutella and/or sliced fruit but I adore them plain and always warm. There’s so much flavor, they don’t even need a dusting of powdered sugar to feel finished.

Keep leftover waffles, should such a thing exist, in the freezer. If you’re making the full batch with the express intent of freezing them, you might want to cook them to half-a-shade lighter, so that when they’re reheated in a 200 degree oven, they won’t get too dark.

Cleaning up: As you make more and more of these waffles, the melted sugar might pile deliciously up on your waffle iron. As I mentioned above, I’ve fallen in love with a waffle maker with removable plates and sure didn’t mind the ease with which I cleaned this up. But don’t fret if you’re stuck with the well, stuck, kind, even if it’s coated with hardened caramel because warm water melts sugar, 100% of the time. Thus, a rubbing even a non-abrasive soaked in warm water back and forth over any sugar-hardened bits will dissolve them."
                                },
                                {
                                  author: users[1],
                                  image: Image.create(url: "https://www.filepicker.io/api/file/tOGEsiEbSkGAe6w9VByT"),
                                  title: "Chocolate Chunk Cookies",
                                  tag_ids: [4],
                                  body: "Yield: Approximately 18 to 24 cookies

1/2 cup (4 ounces or 113 grams) unsalted butter, at room temperature
2 tablespoons (25 grams) granulated sugar
2 tablespoons (25 grams) turbinado sugar (aka Sugar in the Raw; you can use more brown or white if you don’t have this, but the subtle crunch it adds is delightful)
3/4 cup plus 2 tablespoons (165 grams) packed light or dark brown sugar
1 large egg
1 teaspoon vanilla extract
3/4 teaspoon baking soda
Heaped 1/4 teaspoon (or, technically, 1/4 + 1/8 teaspoon) fine sea or table salt
1 3/4 cups (220 grams) all-purpose flour
1/2 pound (225 grams) semi- or bittersweet chocolate, cut into roughly 1/2-inch chunks with a serrated knife
Flaky sea salt, to finish

Heat oven to 360°F (180°C) and line a baking sheet with parchment paper or a silicon baking mat.

In a large bowl, cream the butter and sugars together with an electric mixer until very light and fluffy, about 5 minutes. Add egg and vanilla, beating until incorporated, and scraping down the bowl as needed. Beat in salt fine sea or table salt and baking soda until combined, then the flour on a low speed until just mixed. The dough will look crumbly at this point. With a spatula, fold/stir in the chocolate chunks.

Scoop cookies into 1 1/2 tablespoon (I used a #40 scoop) mounds, spacing them apart on the prepared baking sheet. Sprinkle each with a few flakes of sea salt. Bake for 11 to 12 minutes, until golden on the outside but still very gooey and soft inside. Out of the oven, let rest on baking sheet out of the for 5 minutes before transferring a cooling rack.

Extra dough — I know, what’s that?! — can be formed into scoops and frozen on a sheet until solid, then transferred to a freezer bag. I’ve baked these right from the freezer; they need, at most, 1 minute more baking time. You could also form them into a 2-inch log, freeze it, and slice and bake the cookies off as desired. The only difference I’ve noted between the cookies baked right away and those baked a day or more later is that the older cookie dough is less puffy when baked."
                                  },
                                  {
                                    author: users[1],
                                    image: Image.create(
                                      url: "https://www.filepicker.io/api/file/tFfl59MSTKquP4On4idR"
                                    ),
                                    title: "Key Lime Pie",
                                    tag_ids: [4, 15],
                                    body: "Crust
1 1/2 cups (155 grams) finely ground graham cracker crumbs (from about 10 crackers)
3 tablespoons (40 grams) granulated sugar
2 pinches sea salt
7 tablespoons (100 grams) unsalted butter, melted

Filling
1 1/2 tablespoons finely grated lime zest
3 large egg yolks (though extra-large would do you no harm here)
1 14-ounce (396-gram) can sweetened condensed milk
2/3 cup (155 ml) fresh lime juice (from about 1 dozen tiny key limes or 4 persian/regular limes)

To Finish
3/4 cup (175 ml) heavy whipping cream
1 to 2 tablespoons powdered or granulated sugar, to taste

Heat oven: To 350°F (176°C).

Make crust: Combine graham crumbs, sugar and salt in a medium bowl and stir until mixed. Add butter and stir until crumbs are evenly coated. Press crumbs into the bottom and up the sides of a standard 9-inch pie dish. I like to use the outer edge of a heavy measuring cup to press in neat, firm sides but nobody will be the wiser if you just use your fingertips. Bake crust until lightly browned, about 10 minutes. Set on cooling rack while you prepare filling. Leave oven on.

Make filling: Zest limes into the bottom of a medium bowl until you have 1 1/2 tablespoons. Beat zest and egg yolks with an electric mixer until pale and thick, about 5 minutes. Add sweetened condensed milk and beat until thickened again, about 3 minutes more. Squeeze zested limes until you have 2/3 cups juice. Whisk into yolk mixture until combined. Pour into graham crust and bake pie for another 10 minutes, until set but not browned on top at all. Let pie cool completely before adding topping — you can do this outside (thank you, January!) or even in your freezer (but don’t forget about it) to hasten the process, and your pie reward, along.

Make topping: In a medium bowl, beat cream and sugar until soft peaks are formed. Spread over top of chilled pie. Ideally, pie should be chilled at least another 2 to 3 hours with the cream on top so that it can fully set before you take a slice, but whether that happens is between you and your pie."
                                    },
                                    {
                                      author: users[2],
                                      image: Image.create(
                                        url: "https://www.filepicker.io/api/file/TKxom4kSiGvQLS2H9Iwo"
                                      ),
                                      title: "Passionfruit Green Tea Whiskey",
                                      tag_ids: [7],
                                      body: "Serving Size: 2

Ingredients

3 passion fruits
3/4 cup unsweetened green tea, chilled
4 tbsp honey
4 ounces whiskey
Crushed ice
Instructions

Scoop out the flesh inside the passion fruits and add it to a shaker, along with green tea and honey. Shake until the honey has completely dissolved. Add the whiskey and shake to blend. Divide the mixture into two glasses filled with crushed ice. Drink up."
                                      },
                                      {
                                        author: users[2],
                                        image: Image.create(
                                          url: "https://www.filepicker.io/api/file/bX4tuSeR0G5sCGgkh3QH"
                                        ),
                                        title: "Banana Donuts",
                                        tag_ids: [1, 4, 16],
                                        body: "Yield: 12 ~ 14 donuts
Ingredients

2 large or 3 small ripen bananas (300 grams peeled)
2 tbsp light brown sugar
3 tbsp (25 grams) bread flour
2 cups (290 grams) bread flour
1 large egg
1 1/2 tsp instant dry yeast
1/4 tsp salt
3 tbsp (43 grams) unsalted butter, soften
Canola oil for frying
1/2 cup powdered sugar
1 tsp ground allspice
Instructions

TO MAKE THE DOUGH: Combine bananas and light brown sugar in a pot, then mash/liquify the bananas as much as you can with a whisk. Add 3 tbsp of bread flour, mix well, then set over medium heat and cook until the mixture has thickened. Chill in the fridge until just warm to the touch.
Add the banana-mixture to a stand-mixer bowl (or a large bowl if you're using hand-held mixer with a dough-hook), along with bread flour, large egg, instant dry yeast and salt. Knead on medium speed until elastic and smooth, approx 3~5 min. The dough should feel tacky but not too wet. If the dough feels dry and has difficulty coming together, add a bit more mashed/liquified bananas. Now knead in the unsalted butter, 1 tbsp at a time, until fully incorporated. Increase the speed to high, and knead for 10 min until extremely elastic, shiny and smooth. The dough should be able to stretch out slowly without breaking. Cover the bowl with plastic-wrap and let proof at a warm space for 2 hours, or until doubled.
Transfer the dough onto a floured surface, and roll out into 1/3\" (1 cm) thickness. Cut out as many donuts as you can, then gather the scraps and cut again. You should have about 12~14 donuts, and donut-holes. Transfer the donuts to a lightly-floured baking-sheet, cover with plastic wrap and proof again for 1 hour, until puffy and slightly risen (*sufficient 2nd proofing will make the difference between dense donuts and soft/airy ones*).
TO FRY THE DONUTS: Add enough canola oil to a frying-pot until it reaches 1 1/2\" (4 cm) deep. Set over medium-high heat and bring to a temperature of 350F/175C, or until it bubbles up immediately around an inserted wooden chopstick. Gently lower the donuts into the oil, without crowding the pot, and turn frequently until puffed and golden browned. Drain on a cooling rack and repeat with the rest.
TO SERVE: Mix powdered sugar together with ground allspice, and spoon generously over the warm donuts.
Notes

This recipe is best made with high-gluten bread flour, with protein-content in between 11% ~ 14%. The prolonged kneading which turns it into an extremely shiny, elastic and stretchable dough is also important to develop the desired chewiness. I've never attempted to make this recipe by bare hands, but if you do, I'd imagine it would be quite a work-out but not entirely impossible."
                                        },
                                        {
                                          author: users[2],
                                          image: Image.create(
                                            url: "https://www.filepicker.io/api/file/fJY8aVQQ3qO5Ihine61G"
                                          ),
                                          title: "Beer Roasted Duck",
                                          tag_ids: [3, 15],
                                          body: "Ingredients:

1 peking duck （1.5 kg ~ 2 kg), gutted and cleaned
Shaoxing wine, or Italian grappa for brushing
The brine:
4 cups (1000 ml) water
1 cup (26 grams) whole Asian dried chili
130 grams (roughly scant 1/2 cup of table salt) salt, or kosher salt
1/3 cup (60 grams) dark brown sugar
1/4 cup (50 grams) granulated sugar
2 tbsp of chicken bouillon
6 cloves of garlic, smashed
2″ (30 grams) ginger, sliced
the spices:
2 tbsp of sichuan peppercorn
1 tbsp of white peppercorn
1 (12 grams) cinnamon stick
5 (8 grams) star anise
6 large (3 grams) dried bay leaves
1 1/2 tbsp (9 grams) cumin seeds
1 tbsp (6 grams) fennel seeds
1 black cardamon, or 6 green cardamon
1/2 tsp (3 grams) whole cloves
4 cups (1000 ml) of beer
To brine the duck:  Use a mortar or spice-grinder, pulse “the spices” until they are coarsely ground.  Combine the ground spices, water, whole dried chili, salt, dark brown sugar, granulated sugar, smashed garlic and ginger slices in a large pot.  Simmer the mixture on medium-low heat, with the lid on (to prevent moisture loss), for 30 min to release the fragrance from the aromatics.  Turn off the heat and add the cold beer.  Once the brine has cooled, submerge the duck in it and keep inside the fridge for at least 18 hours, up to 48 hours, turning the duck once if necessary.

To roast the duck:  Preheat the oven on 300ºF/150ºC.

Clean off any spices sticking on the skin or inside the cavity of the duck (rinse with a bit of water if you need to), then pat the duck as dry as you can with a clean towel.  Use 2~3 toothpicks to sew/seal the skins around the cavity-opening tightly together (as pictured), to keep the inside moist during roasting.  If your duck comes without neck and head, sew/seal the neck-opening, too.  Brush the duck evenly with shaoxing wine (or Italian grappa).

If your oven is tall enough to hang the duck, you can insert a hook (any kitchen hooks will do) at where the breast and neck meets, and hang the duck hooked onto a baking-rack that’s set on the highest level in the oven, with a baking-sheet on the bottom to catch dripping.  But if your oven is too small to hang the duck (like mine), then simply lay the duck breast-side-up first, on top of a baking-rack with an aluminium-lined baking-sheet underneath.

Roast the duck for 3 hours until golden browned and glorious, turning it once or twice accordingly for evenness.  If at the last 20 min, it looks like it needs a boost, turn the heat up to 375ºF/190ºC.

To cut the duck:  The best tool for this is a shark kitchen-scissor.  Remove all the toothpicks, then cut the breasts starting from the cavity-opening, right through the center, until you reach the neck.  Then turn the duck over, and cut the thin strip of back bone (sacrificing as little meat as you can) starting from the butt, right through the center, until you reach the neck as well.  Then separate the legs and wings from the breasts, and cut everything into smaller pieces.  Serve immediately."
                                          },
                                          {
                                            author: users[2],
                                            image: Image.create(
                                              url: "https://www.filepicker.io/api/file/3enqDbPvSFmO0I7cZr0a"
                                            ),
                                            title: "Tom Yum Tomato Soup",
                                            tag_ids: [2, 3, 9, 10, 18],
                                            body: "Servings: 2 ~ 4

If you don’t have leftover shrimp heads/shells, you can still apply serious shrimp flavours by using Thai shrimp fat/paste, which can be commonly found online or Asian grocery stores.  This is DIFFERENT from the salty, stinky shrimp paste used to season many Southeast Asian dishes.  Sometimes the bottle is labeled “shrimp fat”.  It’s a secret weapon to keep in your fridge as it adds intense flavours to your seafood dishes.

I am using coconut cream instead of coconut milk for its thicker and creamier texture.  If you can only find coconut milk (as it is more common), leave out “1 cup of water” and add 1 cup of coconut milk (instead of 1/2 cup of coconut cream) to the mix.

Ingredients:

6 large shrimp heads, or equivalent amount of shrimp shells, or 2 tbsp of Thai shrimp fat/paste
5 (65 g) lemongrass, finely diced
7 (30 g) slices of ginger (use Southeast Asian galangal if available)
3 ~ 4 shallots, diced
5 kafir lime leaves, torn by hand
2 ~ 3 red Thai chilis, diced
Pinch of ground black pepper
2 cans (800 g) of peeled tomato
1 cup of water
1/2 cup of coconut cream
1/4 cup of lime juice
3 1/2 tbsp of fish sauce
1 tsp of sugar
Kafir lime leaf oil:
4 kafir lime leaves
1/8 tsp of sea salt
1 tbsp of extra virgin olive oil
3 ~ 4 tbsp of coconut cream to finish
1 loaf of rustic bread
Puree the canned tomato in a blender until very smooth.  Set aside.  With shrimp heads/shells, cut them into small pieces with a kitchen scissor.

Heat up 1 tbsp of olive oil in a soup-pot over medium-high heat and saute the heads/shells (or 2 tbsp of Thai shrimp fat/paste) until they turn orange and fragrant, approx 2 min.  Add the diced lemongrass, ginger, shallots, kafir lime leaves, red chilis, black pepper, pureed tomato, water, coconut cream, lime juice, fish sauce and sugar.  Turn the heat down to simmer and cook for 30 ~ 40 min, until the liquid has reduced by 1 cup (approx 1/5 of the liquid should have evaporated).  Turn off the heat and strain the soup through a sieve.  Press down with a wooden spoon to extract as much liquid as you can.  Discard the scraps.  Adjust the seasoning with more fish sauce if needed.

To make the kafir lime leaf oil:  While the soup is simmering, torn the soft leafy-parts of the kafir lime leaves from the tough central rib.  Discard the ribs.  Ground the leaves and sea salt with a stone-mortar (or mince extremely fine by hand with a knife), then add the extra virgin olive oil and mix evenly together.  Set aside.

Add to each serving with 1/2 tsp of the kafir lime leaf oil, and 1 tbsp more of coconut cream.  Serve with rustic bread and a wedge of lime."
                                            },
                                            {
                                              author: users[2],
                                              image: Image.create(
                                                url: "https://www.filepicker.io/api/file/oZpmVWnBSH21FLkttL3u"
                                              ),
                                              title: "Cherry Amaretto Sour",
                                              tag_ids: [7, 15],
                                              body: "Ingredients:

4~5 cherries, pitted
1 tsp of brown sugar
2 ounces (4 tbsp) of Amaretto
1 1/2 ounce (3 tbsp) of freshly squeezed lemon juice, strained of seeds and pulp
1/2 ounce (1 tbsp) of bourbon
2 cups of ice
Add the pitted cherries and brown sugar in the shaker and mash with a rolling pin or wooden spoon until the sugar has melted and a lot of juice has released.  Add the amaretto, lemon juice, bourbon and ice.  Close the lid of the shaker and shake until the shaker is almost too cold to hold, approx 15 ~ 20 seconds.  Pour the cocktail into a pre-chilled glass through the shaker-strainer.  If you want the mashed cherries and a few ice-cubes in the cocktail like I do, open the shaker and fish out the cherries with a spoon.  Add to the cocktail with a few ice-cubes."
                                              },
                                              {
                                                author: users[2],
                                                image: Image.create(
                                                  url: "https://www.filepicker.io/api/file/YQKZp4REQl2W4di6VnXi"
                                                ),
                                                title: "Arugula and Yogurt Pesto Pasta",
                                                tag_ids: [2, 3, 8],
                                                body: "Servings: 4

This is a very refreshing and relatively healthy pasta salad that uses yogurt instead of mayonaise.  It is infinitely adaptable with other flavorful greens/herbs like spinach, blenched broccoli or ramp, dill, basil and etc.  Coppa can be substituted with prosciutto or even salami.  It gets even more luscious and rich with a warm hot spring egg.

Ingredients:

170 g of arugula (after trimming)
210 g of Greek yogurt
1/2 cup (60 g) of freshly grated Parmigiano cheese
3 tbsp (35 g) of pine nuts, toasted
3 cloves of garlic
1 tsp of salt
1/2 tsp of ground black pepper
pinch of freshly grated nutmeg
300 g of dry pasta
Cured coppa or prosciutto
Extra virgin olive oil for drizzling
Extra parmigiano cheese for shaving
Wash the arugula and trim off the tough roots if any.  You should have 170 g after trimming.  Toast the pine nuts on a pan over medium heat until lightly browned.

Add arugula, Greek yogurt, grated Parmigiano cheese, toasted pine nuts, garlic, salt, black pepper and nutmeg in a food processor.  Run until finely blended.  Bring a large pot of water to boil with a big pinch of salt.  Cook the pasta according to package instruction until al dente.  Drain the pasta REALLY well and rid of any excess water.  Toss with the arugula/yogurt pesto.

Use a peeler to shave Parmigiano cheese over the top, and torn off small pieces of coppa/prosciutto to scatter on top.  Drizzle with extra virgin olive oil and crack fresh black peppers.  Serve warm or at room temperature."
                                                },
                                                {
                                                  author: users[2],
                                                  image: Image.create(
                                                    url: "https://www.filepicker.io/api/file/iuDwFFojSEC63VUrRxWI"
                                                  ),
                                                  title: "Fig and Ricotta Cheesecake Popsicles",
                                                  tag_ids: [4],
                                                  body: "Yield: approx 12 popsicles depending on size

Ingredients

1 cup (240 grams) whole milk ricotta cheese
3/4 cup (230 grams) sweetened condensed milk
1/4 cup (58 grams) half-and-half, or heavy cream
2 tbsp (26 grams) good quality honey
1/4 + 1/8 tsp sea salt
7 fully ripen figs, or any other fruits that you prefer
Instructions

In a blender or with hand-held immersion blender, blend ricotta cheese, sweetened condensed milk, half-and-half, honey and sea salt together until very smooth and lump-free. Set aside in an easy-to-pour container. Cut off the stems of the figs (which can taste raw and bitter), then cut into thick slices that are about the width of your popsicle-molds (so they will stay right against the edges and look pretty for you). Place 2~3 slices (you can cut each one up to fit the molds however you like) into the molds so the figs occupy about 1/3 of the space (do not over-fill or you'll just get sticks of frozen fruits). Gently insert a small knife right in the middle through the figs to make way for the wooden-handle, then insert the handles. Pour the ricotta-mixture slowly into each mold. Once it fills to the top, gently tap the mold on the counter for 10 seconds to release air-bubbles and help the ricotta-mixture seep to the bottom. The liquid-level should go down slightly as it makes its way downward, so fill it again to the top. Repeat with the rest.
Freeze for at least 12 hours until hardened. If you can spare the molds, I recommend keeping the popsicles inside the molds, and only remove each as needed. Taking them out and wrapping in plastic-wrap will result in melted surface and crinkles, and all this beautiful effort will be wasted (trust me.. I know).
Notes

Instead of figs, which can be an acquired taste, you can also use peaches, summer berries, mangos, or even lychees."
                                                  },
                                                  {
                                                    author: users[3],
                                                    image: Image.create(
                                                      url: "https://www.filepicker.io/api/file/601oqyQSKSysUivclRKM"
                                                    ),
                                                    title: "Avocado Lemon Zest Pasta",
                                                    tag_ids: [2, 3, 5, 6, 8, 19],
                                                    body: "Recipe from A Modern Way to Eat, by Anna Jones published by Ten Speed Press.
Serves: serves 4
Ingredients
sea salt and freshly ground black pepper
400g brown rice spaghetti
olive oil
4 tablespoons capers in brine, roughly chopped
1 clove of garlic, peeled and very finely sliced
grated zest of 2 unwaxed lemons, and juice of 1⁄2 a lemon
a bunch of fresh basil, leaves picked
a bunch of fresh parsley, leaves picked
2 ripe avocados
Instructions
Fill a big pan with boiling water and add a good pinch of salt. Bring to a rolling boil, then add the pasta and cook for 8–10 minutes, or according to the instructions on the packet, until perfectly al dente.
Heat some olive oil in a large frying pan on a low heat, then add the capers and garlic and sizzle gently until the edge of the garlic starts to very slightly brown. Remove from the heat and add the lemon zest.
Chop the herbs and add them to the pan. Halve and destone the avocados, then use a knife to make criss-cross cuts through the flesh, chopping it inside the skin. Use a spoon to scoop out each half into the pan, and stir to mix all the flavours together.
Before you drain the pasta, carefully scoop out half a mugful of the pasta water. Drain the pasta and add it to the frying pan with a little of the cooking water and a good drizzle of olive oil. Taste and add salt, pepper and lemon juice as needed. Scoop the pasta into bowls and eat on your lap.
Notes
I used watercress instead of parsley, and I tossed it in at the very end."
                                                    },
                                                    {
                                                      author: users[3],
                                                      image: Image.create(
                                                        url: "https://www.filepicker.io/api/file/g0k5NnWaQZYNt1jGJbZ7"
                                                      ),
                                                      title: "Green Bean and Purple Potato Salad",
                                                      tag_ids: [2, 3, 5, 6, 12],
                                                      body: "Serves: serves 4 as a side
Ingredients
6-8 small-medium purple potatoes (about ¾ pound)
2 tablespoons olive oil, more to taste
1 clove garlic, minced
1 heaping teaspoon of capers
1 teaspoon dijon mustard
2 big handfuls of green and/or yellow wax beans
Juice and zest of 1 lemon
2 scallions, chopped
¼ cup fresh parsley, chopped
¼ cup fresh oregano leaves
¼ teaspoon red pepper flakes
sea salt and freshly ground black pepper
optional:
½ cup cooked chickpeas
½ cup cooked bulgur (quinoa, or millet if gluten free)
soft boiled eggs (instructions here)
pickled onions (not pictured, but a tasty addition)
Instructions
Bring a large pot of salted water to a boil. Scrub the potatoes and slice them into 1 inch pieces. Add the potatoes and cook until knife-tender, about 15 minutes. (Alternatively, you could roast them in the oven with a drizzle of olive oil at 400°F for 20-25 minutes).
Meanwhile, in a large bowl, combine the olive oil, garlic, capers, mustard and generous pinches of salt and pepper. Use a rubber spatula or wooden spoon to smash the garlic and capers into a paste at the bottom of the bowl. When your potatoes are done, scoop them out of the water (leave the water boiling for your green beans), transfer them to the bowl, and toss to coat them with the 'dressing' at the bottom of the bowl.
Prepare a bowl of ice water and place it near your pot of boiling water. Add the green beans to the boiling water and cook they’re tender but still vibrant. About 3 minutes. Scoop them out of the boiling water and into the ice bath to cool - about 1 minute. Drain and toss them into the bowl of potatoes. Add the lemon juice, zest, scallions, parsley, oregano, and red pepper flakes and toss to coat.
Taste and add more salt, pepper, lemon juice to taste. If your salad is a little dry, drizzle some more olive oil and toss again.
Optional: add cooked chickpeas, a (cooked) grain, and/or a few soft-boiled eggs."
                                                      },
                                                      {
                                                        author: users[3],
                                                        image: Image.create(
                                                          url: "https://www.filepicker.io/api/file/4NN2myLTAiLxLDPP9ttq"
                                                        ),
                                                        title: "Vegan Mac and Cheese",
                                                        tag_ids: [2, 3, 5, 6, 8],
                                                        body: "Ingredients
1 shallot, chopped
2 garlic cloves, minced
Extra-virgin olive oil, for drizzling
½ teaspoon smoked paprika
1 tablespoon balsamic vinegar
1 cup raw cashews, soaked 3 to 4 hours, preferably overnight, and drained
3 tablespoons extra-virgin olive oil
½ cup water
¼ cup nutritional yeast
2 teaspoons turmeric
Pinch of cayenne pepper
Sea salt and freshly ground black pepper
12 ounces macaroni or small shell pasta
4 cups packed spinach
Instructions
In a small skillet, heat a drizzle of olive oil over medium-low heat. Add the shallot and garlic and sauté until soft, about 3 to 5 minutes. Stir in the paprika and balsamic vinegar and cook another 30 seconds.
In a high speed blender, puree the sautéed shallot mixture with the cashews, 3 tablespoons of olive oil, the water, nutritional yeast, turmeric, a pinch of cayenne, a pinch of salt, and freshly ground pepper. Makes about 1 ¾ cups of sauce.
Bring a large pot of salted water to a boil. Prepare the pasta according to the instructions on the package, cooking until al dente. Reserve 1 cup of the pasta water. Drain and return the pasta to the pot. Stir in the sauce, adding the pasta water as needed to thin the sauce and make it creamy. Add the spinach, stir until wilted, and serve."
                                                        },
                                                        {
                                                          author: users[3],
                                                          image: Image.create(
                                                            url: "https://www.filepicker.io/api/file/WXXILqFRTEE5mdHn0Vfw"
                                                          ),
                                                          title: "Cinnamon Quinoa Breakfast Bowl",
                                                          tag_ids: [1, 5, 6, 14],
                                                          body: "Serves: serves 2
Ingredients
½ cup uncooked quinoa
1 cup Almond Breeze Almondmilk, Original or Vanilla
1-2 cinnamon sticks
pinch of salt
piece of a vanilla bean, optional (don’t use vanilla extract)
toppings:
toasted sliced almonds
toasted coconut flakes
peaches
raspberries
maple syrup, optional
extra splashes of almond milk, optional
more spices, to taste (cinnamon, nutmeg, etc.), optional
Instructions
Rinse and drain the quinoa.
Place it in a small saucepan and add the almond milk, 1-2 cinnamon sticks, and a pinch of salt. Bring to a high simmer, cover and reduce heat to a low simmer for 15 minutes. (Tip: don't walk away, if it starts bubbling, turn the heat off, give it one stir mid-cook if you need to, and resume).
After 15 minutes, remove the pan from the heat and let the quinoa sit for 5 more minutes or until the almond milk is absorbed and the quinoa is cooked. Taste and add additional spices to your liking.
Scoop the quinoa into two bowls and top with toasted almonds, toasted coconut, and fruit. Serve with maple syrup if you like. Enjoy as a fluffy pilaf, or as more a porridge with warm almond milk poured on top.
Notes
- cooked quinoa can be stored in the fridge for 4-5 days. Serve at room temp or heat it as you're ready to serve. If it's dry, add a few more splashes of almond milk.
- sub in whatever seasonal fruit you like, dried fruits are also delicious here."
                                                          },
                                                          {
                                                            author: users[3],
                                                            image: Image.create(
                                                              url: "https://www.filepicker.io/api/file/NpwIVZqQQcCqVH14mCGU"
                                                            ),
                                                            title: "Matcha Mango Smoothies",
                                                            tag_ids: [1, 5, 6, 7],
                                                            body: "Serves: 2 large or 3 small smoothies
Ingredients
2 tablespoons Aiya Matcha Zen Cafe Blend
(or 2 teaspoons Aiya Cooking Grade Matcha)
1 cup almond milk
1 mango, sliced
a few handfuls of ice
optional - 1 frozen banana
Instructions
Blend all ingredients until smooth. For a creamier smoothie, add a frozen banana."
                                                            },
                                                            {
                                                              author: users[3],
                                                              image: Image.create(
                                                                url: "https://www.filepicker.io/api/file/KJJ7jPwoScCLViSBJljQ"
                                                              ),
                                                              title: "Curried Sweet Potato Soup",
                                                              tag_ids: [2, 3, 5, 6, 18],
                                                              body: "Serves: serves 3-4 as a main, 4-6 as a side
Ingredients
2 tablespoons coconut oil
1 onion, chopped
2 cloves garlic, minced
1 tablespoons madras curry powder
2 medium sweet potatoes, chopped into cubes
½ cup peas (can be frozen)
1 can lite coconut milk (2 cups)
2-4 cups veggie broth (less for a thicker consistency, more for thicker)
2 tablespoons brown sugar
squeeze of one juicy lime
a few handfuls of spinach
salt
handful of chopped cilantro, for garnish
a few pinches of red pepper flakes
Instructions
In a large pot, heat coconut oil. Add onion and some salt salt. Cook, stirring, until it becomes translucent. (about 5 minutes). Add curry powder and garlic and cook for another 30 seconds (don’t let either burn).
Add a good squeeze of lime, coconut milk, broth, chopped sweet potatoes, brown sugar and a little more salt. Turn heat down and simmer, covered, until the sweet potatoes are soft (20-30 minutes).
Stir in the peas and spinach and cook for just another minute or two.
Taste and adjust seasonings, adding a few pinches of red pepper flakes if you want it a little spicy.
Top with cilantro and serve with naan bread on the side."
                                                            },
                                                            {
                                                              author: users[3],
                                                              image: Image.create(
                                                                url: "https://www.filepicker.io/api/file/kiby54sRg2eNtdqoRduz"
                                                              ),
                                                              title: "Creamy Vegan Tomato Soup",
                                                              tag_ids: [2, 3, 5, 6, 10, 18],
                                                              body: "serves 2-3

INGREDIENTS:
a few tablespoons of olive oil
4 shallots, chopped
2 cloves of garlic, smashed
1/2 cup white wine
4 cups veggie broth
1 cup coconut milk (I used full fat), plus more if needed at the end
1/2 cup sun dried tomatoes (from a jar, packed in oil)
pinch of dried oregano
red pepper flakes
handful of coarsely chopped fresh basil, plus extra for garnish
2 teaspoons balsamic vinegar (or to taste)
1-2 teaspoons or so maple syrup or a pinch of sugar (optional, to taste)
1/4 cup toasted pine nuts (optional, but adds a nice richness)
salt & pepper

METHOD:
Heat oil a medium pot, heat oil over medium heat. Add shallots and garlic, some salt & pepper, and cook until the shallots are transluscent. About 4 minutes.

Add wine, stir, and let the wine cook out for another few minutes. Add broth, coconut milk, and sundried tomatoes and a pinch of dried oregano and red pepper flakes. Stir, then reduce heat and let simmer for 30 minutes or so.

Remove from heat, add a handful of basil and blend the soup until smooth, ideally in a Vitamix or similar.

Taste and add balsamic, maple syrup or sugar, and pine nuts. Give the blender just a few pulses. Taste and adjust seasonings. Serve with an extra swirl of coconut milk, some chopped basil, and a few red pepper flakes on top."
                                                            },
                                                            {
                                                              author: users[3],
                                                              image: Image.create(
                                                                url: "https://www.filepicker.io/api/file/Y5HuYvSLSGiIeN9FSffQ"
                                                              ),
                                                              title: "Vegan Blackberry Lemon Cake",
                                                              tag_ids: [4, 6, 14, 15],
                                                              body: "Serves: serves 4-6
Ingredients
1 cup white flour
1 cup spelt flour
1 teaspoon baking powder
1 teaspoon baking soda
½ teaspoon salt
1 cup almond milk
¾ cup sugar
½ cup coconut oil, melted
juice and zest of one lemon (equalling ¼ cup juice)
1 teaspoon lemon oil
1 teaspoon vanilla
blackberry topping:
1 cup blackberries
1 teaspoon sugar
pinch of salt
coconut cream frosting:
this recipe plus a few drops of lemon oil
Instructions
Preheat oven to 350 and grease a 6\" round cake pan or equivalent.
In a medium bowl, sift together all dry ingredients except for the sugar.
In another bowl, whisk together the almond milk, sugar, coconut oil, lemon juice, lemon zest, lemon oil and vanilla. Gradually add in your dry ingredients, whisking together each addition.
Pour the batter into your baking pan and bake for 25-30 minutes or until a toothpick comes out nearly clean.
While the cake cools, mix together the blackberries, sugar, and a pinch of salt. Using your hands or a fork, gently mash some of the berries. Set aside.
Once the cake is cool, frost & top with the blackberries.
Notes
Note: This cake is on the crumbly side since it has no egg. For best cohesion, let it cool completely before digging in.

This cake is best served same-day otherwise the coconut cream melts (at room temp). If you intend to keep it longer, make smaller cakes, store the frosting separately in the fridge and frost as you're ready to eat."
                                                            }
                                                          ])




recipes[0].comments.create([
    { author: users[2],
      body: "It's zucchini season!"
    }
])

recipes[0].annotations.create([
    { author: users[2],
      start_idx: 427,
      end_idx: 441,
      body: "Any ideas for substitutions?"
    },
    {
      author: users[0],
      start_idx: 209,
      end_idx: 238,
      body: "I probably used twice as much of this and still would have enjoyed more!"
    }
])

recipes[9].comments.create([
    { author: users[3],
      body: "Hmmm..."
    },
    {
      author: users[0],
      body: "Wow, this looks incredible!"
    }
])
