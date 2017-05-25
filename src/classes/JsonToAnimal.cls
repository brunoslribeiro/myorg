public class JsonToAnimal {
	public Animal animal;	
	
	public static Animal parse(String json) {
		return (Animal) System.JSON.deserialize(json, JsonToAnimal.class);
	}
}