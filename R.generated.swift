//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `PlaceDetails`.
    static let placeDetails = _R.storyboard.placeDetails()
    /// Storyboard `PlanDetails`.
    static let planDetails = _R.storyboard.planDetails()
    /// Storyboard `SideBar`.
    static let sideBar = _R.storyboard.sideBar()
    /// Storyboard `TripCreationNavigator`.
    static let tripCreationNavigator = _R.storyboard.tripCreationNavigator()
    /// Storyboard `TripLegend`.
    static let tripLegend = _R.storyboard.tripLegend()
    /// Storyboard `TripsHistory`.
    static let tripsHistory = _R.storyboard.tripsHistory()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "PlaceDetails", bundle: ...)`
    static func placeDetails(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.placeDetails)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "PlanDetails", bundle: ...)`
    static func planDetails(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.planDetails)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "SideBar", bundle: ...)`
    static func sideBar(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.sideBar)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "TripCreationNavigator", bundle: ...)`
    static func tripCreationNavigator(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.tripCreationNavigator)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "TripLegend", bundle: ...)`
    static func tripLegend(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.tripLegend)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "TripsHistory", bundle: ...)`
    static func tripsHistory(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.tripsHistory)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `illuminating`.
    static let illuminating = Rswift.ColorResource(bundle: R.hostingBundle, name: "illuminating")
    /// Color `ultimateGray`.
    static let ultimateGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "ultimateGray")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "illuminating", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func illuminating(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.illuminating, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ultimateGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func ultimateGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.ultimateGray, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `tripCellIdentifier`.
    static let tripCellIdentifier: Rswift.ReuseIdentifier<TripCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "tripCellIdentifier")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try placeDetails.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try planDetails.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try sideBar.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try tripCreationNavigator.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try tripLegend.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try tripsHistory.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct placeDetails: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = PlaceDetailsViewController

      let bundle = R.hostingBundle
      let name = "PlaceDetails"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "square.and.pencil") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'square.and.pencil' is used in storyboard 'PlaceDetails', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct planDetails: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = PlanDetailsViewController

      let bundle = R.hostingBundle
      let name = "PlanDetails"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "square.and.pencil") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'square.and.pencil' is used in storyboard 'PlanDetails', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct sideBar: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = SideBarViewController

      let bundle = R.hostingBundle
      let name = "SideBar"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct tripCreationNavigator: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TripCreationNavigatorViewController

      let bundle = R.hostingBundle
      let name = "TripCreationNavigator"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct tripLegend: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TripLegendViewController

      let bundle = R.hostingBundle
      let name = "TripLegend"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "plus") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'plus' is used in storyboard 'TripLegend', but couldn't be loaded.") } }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "square.and.pencil") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'square.and.pencil' is used in storyboard 'TripLegend', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct tripsHistory: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "TripsHistory"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "plus") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'plus' is used in storyboard 'TripsHistory', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
