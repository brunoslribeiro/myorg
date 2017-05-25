public class LabelService {
	public static List<OptionKeyValue> getLabelsofView(String Language,String AGP){
       return Translation.getLabelsOfAGPAndLanguage(Language,AGP);
    }
}