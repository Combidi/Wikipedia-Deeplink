//
//  Created by Peter Combee on 21/06/2021.
//

#if DEBUG
import SwiftUI

struct ViewControllerRepresentable<ViewController : UIViewController>: UIViewControllerRepresentable {
    
    typealias Updater = (ViewController, Context) -> Void

    var makeViewController: () -> ViewController
    var update: (ViewController, Context) -> Void

    init(
        _ makeViewController: @escaping @autoclosure () -> ViewController,
         updater update: ((ViewController) -> Void)? = nil
    ) {
        self.makeViewController = makeViewController
        self.update = { makeViewController, _ in update?(makeViewController) }
    }

    func makeUIViewController(context: Context) -> ViewController {
        makeViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        update(uiViewController, context)
    }
    
}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(UIViewController()) {
            $0.view.backgroundColor = .red
        }
    }
}
#endif
